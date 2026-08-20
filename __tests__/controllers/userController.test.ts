import {
  signupPost,
  loginPost,
  profileGet,
} from "../../controllers/userController.js";

jest.mock("../../models/userModel.js");
jest.mock("../../controllers/scoreController.js");
jest.mock("bcrypt");

import {
  createUser,
  findUserByUsername,
  findUserById,
} from "../../models/userModel.js";
import { getTop10OfUser } from "../../controllers/scoreController.js";
import bcrypt from "bcrypt";

const mockCreateUser = createUser as jest.MockedFunction<typeof createUser>;
const mockFindUserByUsername = findUserByUsername as jest.MockedFunction<
  typeof findUserByUsername
>;
const mockFindUserById = findUserById as jest.MockedFunction<
  typeof findUserById
>;
const mockGetTop10OfUser = getTop10OfUser as jest.MockedFunction<
  typeof getTop10OfUser
>;
const mockBcryptHash = bcrypt.hash as jest.MockedFunction<typeof bcrypt.hash>;
const mockBcryptCompare = bcrypt.compare as jest.MockedFunction<
  typeof bcrypt.compare
>;

function makeReq(overrides: Record<string, unknown> = {}): any {
  return { body: {}, params: {}, session: {}, ...overrides };
}

function makeRes(): any {
  return { render: jest.fn(), redirect: jest.fn() };
}

const fakeUser = (overrides = {}) =>
  ({
    userId: 1,
    username: "alice",
    passwordHash: "hashed",
    profilePic: null,
    isPublic: true,
    isAdmin: false,
    themeLight: true,
    isActive: true,
    ...overrides,
  }) as any;

beforeEach(() => jest.clearAllMocks());

describe("signupPost", () => {
  it("renders signup error when any required field is missing", async () => {
    const req = makeReq({
      body: { username: "alice", password: "", passwordCheck: "" },
    });
    const res = makeRes();

    await signupPost(req, res);

    expect(res.render).toHaveBeenCalledWith("signup", {
      error: "All fields are required.",
    });
    expect(mockCreateUser).not.toHaveBeenCalled();
  });

  it("renders signup error when passwords do not match", async () => {
    const req = makeReq({
      body: { username: "alice", password: "abc", passwordCheck: "xyz" },
    });
    const res = makeRes();

    await signupPost(req, res);

    expect(res.render).toHaveBeenCalledWith("signup", {
      error: "Passwords do not match.",
    });
  });

  it("renders signup error when username is already taken", async () => {
    const req = makeReq({
      body: { username: "alice", password: "pass", passwordCheck: "pass" },
    });
    const res = makeRes();

    mockFindUserByUsername.mockResolvedValueOnce(fakeUser());

    await signupPost(req, res);

    expect(res.render).toHaveBeenCalledWith("signup", {
      error: "Username is already taken.",
    });
    expect(mockCreateUser).not.toHaveBeenCalled();
  });

  it("creates user, sets session, and redirects on success", async () => {
    const req = makeReq({
      body: { username: "bob", password: "pass", passwordCheck: "pass" },
    });
    const res = makeRes();

    // SignupPost calls findUserByUsername twice: once to check availability, once to read back the newly created user's id before setting the session.
    mockFindUserByUsername
      .mockResolvedValueOnce(undefined as any)
      .mockResolvedValueOnce(fakeUser({ userId: 99, username: "bob" }));
    // `as never` suppresses ts-jest's overload mismatch on bcrypt.hash's return type.
    mockBcryptHash.mockResolvedValue("hashed_pw" as never);
    mockCreateUser.mockResolvedValue(undefined as any);

    await signupPost(req, res);

    expect(mockCreateUser).toHaveBeenCalledWith("bob", "hashed_pw");
    expect(req.session.userId).toBe(99);
    expect(res.redirect).toHaveBeenCalledWith("/profile");
  });
});

describe("loginPost", () => {
  it("renders login error when any field is missing", async () => {
    const req = makeReq({ body: { username: "", password: "" } });
    const res = makeRes();

    await loginPost(req, res);

    expect(res.render).toHaveBeenCalledWith("login", {
      error: "All fields are required.",
    });
  });

  it("renders login error when username is not found", async () => {
    const req = makeReq({ body: { username: "ghost", password: "pass" } });
    const res = makeRes();

    mockFindUserByUsername.mockResolvedValue(undefined as any);

    await loginPost(req, res);

    expect(res.render).toHaveBeenCalledWith("login", {
      error: "Invalid username or password.",
    });
  });

  it("renders login error when password does not match", async () => {
    const req = makeReq({ body: { username: "alice", password: "wrong" } });
    const res = makeRes();

    mockFindUserByUsername.mockResolvedValue(fakeUser());
    mockBcryptCompare.mockResolvedValue(false as never);

    await loginPost(req, res);

    expect(res.render).toHaveBeenCalledWith("login", {
      error: "Invalid username or password.",
    });
  });

  it("sets session and redirects on successful login", async () => {
    const req = makeReq({ body: { username: "alice", password: "correct" } });
    const res = makeRes();

    mockFindUserByUsername.mockResolvedValue(fakeUser({ userId: 7 }));
    mockBcryptCompare.mockResolvedValue(true as never);

    await loginPost(req, res);

    expect(req.session.userId).toBe(7);
    expect(res.redirect).toHaveBeenCalledWith("/profile");
  });
});

describe("profileGet", () => {
  it("redirects to login when no session exists", async () => {
    const req = makeReq({ session: {} });
    const res = makeRes();

    await profileGet(req, res);

    expect(res.redirect).toHaveBeenCalledWith("/login");
  });

  it("redirects to login when userId in session has no matching user", async () => {
    const req = makeReq({ session: { userId: 99 } });
    const res = makeRes();

    mockFindUserById.mockResolvedValue(undefined as any);

    await profileGet(req, res);

    expect(res.redirect).toHaveBeenCalledWith("/login");
  });

  it("renders profile with user data and scores", async () => {
    const req = makeReq({ session: { userId: 1 } });
    const res = makeRes();
    const user = fakeUser();
    const scores = [
      { username: "alice", correctCount: 9, score: 8000, cityName: "Paris" },
    ];

    mockFindUserById.mockResolvedValue(user);
    mockGetTop10OfUser.mockResolvedValue(scores as any);

    await profileGet(req, res);

    expect(res.render).toHaveBeenCalledWith("profile", { user, scores });
  });
});
