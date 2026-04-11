import { Request, Response } from "express";
import bcrypt from "bcrypt";
import { createUser, findUserByUsername } from "../models/userModel.js";

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

  res.redirect("/login");
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

export {
  signupPost,
  loginPost
}
