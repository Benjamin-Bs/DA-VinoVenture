const bcrypt = require("bcrypt");
const db = require("../config/database");

/**
 * @swagger
 * /user-login/login:
 *   post:
 *     summary: User login
 *     tags: [Authentication]
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             type: object
 *             required:
 *               - username
 *               - password
 *             properties:
 *               username:
 *                 type: string
 *                 description: Username of the user
 *               password:
 *                 type: string
 *                 description: Password of the user
 *     responses:
 *       200:
 *         description: Login successful
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 message:
 *                   type: string
 *                   example: "Login erfolgreich"
 *       400:
 *         description: Invalid username or password
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 error:
 *                   type: string
 *                   example: "Ungültiger Benutzer/Passwort"
 *       500:
 *         description: Database error
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 error:
 *                   type: string
 *                   example: "Datenbankfehler"
 */


exports.login = (req, res) => {
  const { username, password } = req.body;

  // Benutzer anhand des Benutzernamens abrufen
  db.get("SELECT * FROM users WHERE username = ?", [username], async (err, user) => {
    if (err) {
      return res.status(500).json({ error: "Datenbankfehler" });
    }
    if (!user) {
      return res.status(400).json({ error: "Ungültiger Benutzer/Passwort" });
    }

    // Passwort überprüfen
    const passwordMatch = await bcrypt.compare(password, user.password);
    if (passwordMatch) {
      // Passwort ist korrekt, Rolle in der Sitzung speichern
      req.session.role = user.role;
      return res.status(200).json({ message: "Login erfolgreich" });
    } else {
      return res.status(400).json({ error: "Ungültiges Passwort" });
    }
  });
};
