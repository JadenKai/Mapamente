import { Request, Response } from "express";
import bcrypt from "bcrypt";
import { createUser, findUserByUsername, findUserById } from "../models/userModel.js";
import { getTop10OfUser } from "./scoreController.js";

const SALT_ROUNDS = 12;

async function signupPost(req: Request, res: Response): Promise<void> {
  const { username, password, passwordCheck } = req.body;

  if (!username || !password || !passwordCheck) {
    res.render('signup', { error: "All fields are required." });
    return;
  }

  if (password !== passwordCheck) {
    res.render("signup", { error: "Passwords do not match." });
    return;
  }

  if (await findUserByUsername(username)) {
    res.render("signup", { error: "Username is already taken." });
    return;
  }

  await createUser(username, await bcrypt.hash(password, SALT_ROUNDS));

  const newUser = await findUserByUsername(username);
  req.session.userId = newUser!.userId;
  res.redirect("/profile");
}

async function loginPost(req: Request, res: Response): Promise<void> {
  const { username, password } = req.body;
  
  if (!username || !password) {
    res.render("login", { error: "All fields are required." });
    return;
  }

  const user = await findUserByUsername(username);

  if (!user) {
    res.render("login", { error: "Invalid username or password." });
    return;
  }

  const match = await bcrypt.compare(password, user.passwordHash);

  if (!match) {
    res.render("login", { error: "Invalid username or password." });
    return;
  }

  req.session.userId = user.userId;
  res.redirect("/profile");
}

// Directs to login if there isn't a a session, otherwise profile
async function profileGet(req: Request, res: Response): Promise<void> {
  if (!req.session.userId) {
    res.redirect("/login");
    return;
  }

  const user = await findUserById(req.session.userId);

  if (!user) {
    res.redirect("/login");
    return;
  }
  
  res.render("profile", { user, scores: getTop10OfUser(user.userId)});
}

export {
  signupPost,
  loginPost,
  profileGet,
}
