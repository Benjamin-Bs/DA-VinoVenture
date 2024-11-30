const { db } = require("../config/database");

/**
 * @swagger
 * /cart/{user_id}:
 *   get:
 *     summary: Get the shopping cart for a user
 *     tags: [Shopping Cart]
 *     parameters:
 *       - in: path
 *         name: user_id
 *         required: true
 *         schema:
 *           type: integer
 *         description: The ID of the user
 *     responses:
 *       200:
 *         description: Shopping cart retrieved successfully
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 cart:
 *                   type: array
 *                   items:
 *                     type: object
 *                     properties:
 *                       package_name:
 *                         type: string
 *                       price:
 *                         type: number
 *                         format: float
 *                       quantity:
 *                         type: integer
 *                       total_price:
 *                         type: number
 *                         format: float
 *       404:
 *         description: Shopping cart not found
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 message:
 *                   type: string
 *       500:
 *         description: Internal server error
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 error:
 *                   type: string
 */

/**
 * @swagger
 * /cart/{user_id}:
 *   post:
 *     summary: Add an item to the shopping cart
 *     tags: [Shopping Cart]
 *     parameters:
 *       - in: path
 *         name: user_id
 *         required: true
 *         schema:
 *           type: integer
 *         description: The ID of the user
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             type: object
 *             required:
 *               - package_id
 *               - quantity
 *             properties:
 *               package_id:
 *                 type: integer
 *               quantity:
 *                 type: integer
 *     responses:
 *       201:
 *         description: Item added to the cart
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 message:
 *                   type: string
 *                 cart_id:
 *                   type: integer
 *                 package_id:
 *                   type: integer
 *                 quantity:
 *                   type: integer
 *       400:
 *         description: Bad request (missing package_id or quantity)
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 message:
 *                   type: string
 *       500:
 *         description: Internal server error
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 error:
 *                   type: string
 */

/**
 * @swagger
 * /cart/{user_id}:
 *   patch:
 *     summary: Update the quantity of an item in the shopping cart
 *     tags: [Shopping Cart]
 *     parameters:
 *       - in: path
 *         name: user_id
 *         required: true
 *         schema:
 *           type: integer
 *         description: The ID of the user
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             type: object
 *             required:
 *               - package_id
 *               - quantity
 *             properties:
 *               package_id:
 *                 type: integer
 *               quantity:
 *                 type: integer
 *     responses:
 *       200:
 *         description: Quantity updated successfully
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 message:
 *                   type: string
 *       404:
 *         description: Item or cart not found
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 message:
 *                   type: string
 *       400:
 *         description: Bad request (missing package_id or quantity)
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 message:
 *                   type: string
 *       500:
 *         description: Internal server error
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 error:
 *                   type: string
 */

/**
 * @swagger
 * /cart/{user_id}/{package_id}:
 *   delete:
 *     summary: Remove an item from the shopping cart
 *     tags: [Shopping Cart]
 *     parameters:
 *       - in: path
 *         name: user_id
 *         required: true
 *         schema:
 *           type: integer
 *         description: The ID of the user
 *       - in: path
 *         name: package_id
 *         required: true
 *         schema:
 *           type: integer
 *         description: The ID of the package to remove
 *     responses:
 *       200:
 *         description: Item removed successfully
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 message:
 *                   type: string
 *       404:
 *         description: Cart or item not found
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 message:
 *                   type: string
 *       400:
 *         description: Bad request (missing package_id)
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 message:
 *                   type: string
 *       500:
 *         description: Internal server error
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 error:
 *                   type: string
 */

exports.getCart = async (req, res) => {
  const userId = req.params.user_id;
  try {
    const [rows] = await db.query(
      `
      SELECT wp.package_name, wp.price, wpsc.quantity, (wp.price * wpsc.quantity) AS total_price
      FROM shipping_cart sc
      JOIN wine_packages_shipping_cart wpsc ON sc.shipping_cart_id = wpsc.shipping_cart_id
      JOIN wine_packages wp ON wpsc.wine_package_id = wp.wine_package_id
      WHERE sc.user_id = ?`,
      [userId]
    );

    if (rows.length === 0) {
      return res.status(404).json({ message: "Warenkorb nicht gefunden" });
    }

    res.json({ cart: rows });
  } catch (err) {
    console.error("Datenbankabfrage fehlgeschlagen:", err);
    return res.status(500).json({ error: err.message });
  }
};

exports.addToCart = async (req, res) => {
  const userId = req.params.user_id;
  const { wine_package_id, quantity } = req.body;

  if (!wine_package_id || !quantity) {
    return res
      .status(400)
      .json({ message: "Package ID und Menge sind erforderlich" });
  }

  try {
    const [cartResult] = await db.query(
      "SELECT shipping_cart_id FROM shipping_cart WHERE user_id = ?",
      [userId]
    );

    let shippingCartId;
    if (cartResult.length === 0) {
      const [createCartResult] = await db.query(
        "INSERT INTO shipping_cart (user_id, quantity) VALUES (?, 0)",
        [userId]
      );
      shippingCartId = createCartResult.insertId;
    } else {
      shippingCartId = cartResult[0].shipping_cart_id;
    }

    const [addPackageResult] = await db.query(
      `
      INSERT INTO wine_packages_shipping_cart (shipping_cart_id, wine_package_id, quantity)
      VALUES (?, ?, ?)
      ON DUPLICATE KEY UPDATE quantity = quantity + VALUES(quantity)`,
      [shippingCartId, wine_package_id, quantity]
    );

    res.status(201).json({
      message: "Weinpaket hinzugefügt",
      shipping_cart_id: shippingCartId,
      wine_package_id,
      quantity,
    });
  } catch (err) {
    console.error("Fehler beim Hinzufügen des Weinpakets:", err);
    return res.status(500).json({ error: err.message });
  }
};

exports.updateCartItem = async (req, res) => {
  const userId = req.params.user_id;
  const { wine_package_id, quantity } = req.body;

  if (!wine_package_id || !quantity) {
    return res
      .status(400)
      .json({ message: "Package ID und Menge sind erforderlich" });
  }

  try {
    const [cartResult] = await db.query(
      "SELECT shipping_cart_id FROM shipping_cart WHERE user_id = ?",
      [userId]
    );

    if (cartResult.length === 0) {
      return res.status(404).json({ message: "Warenkorb nicht gefunden" });
    }

    const shippingCartId = cartResult[0].shipping_cart_id;

    const [updateResult] = await db.query(
      `
      UPDATE wine_packages_shipping_cart
      SET quantity = ?
      WHERE shipping_cart_id = ? AND wine_package_id = ?`,
      [quantity, shippingCartId, wine_package_id]
    );

    if (updateResult.affectedRows === 0) {
      return res
        .status(404)
        .json({ message: "Weinpaket nicht im Warenkorb gefunden" });
    }

    res.json({ message: "Menge des Weinpakets aktualisiert" });
  } catch (err) {
    console.error("Fehler beim Aktualisieren der Menge:", err);
    return res.status(500).json({ error: err.message });
  }
};

exports.removeFromCart = async (req, res) => {
  const userId = req.params.user_id;
  const winePackageId = req.params.wine_package_id;

  if (!winePackageId) {
    return res.status(400).json({ message: "Package ID ist erforderlich" });
  }

  try {
    const [cartResult] = await db.query(
      "SELECT shipping_cart_id FROM shipping_cart WHERE user_id = ?",
      [userId]
    );

    if (cartResult.length === 0) {
      return res.status(404).json({ message: "Warenkorb nicht gefunden" });
    }

    const shippingCartId = cartResult[0].shipping_cart_id;

    const [deleteResult] = await db.query(
      `
      DELETE FROM wine_packages_shipping_cart
      WHERE shipping_cart_id = ? AND wine_package_id = ?`,
      [shippingCartId, winePackageId]
    );

    if (deleteResult.affectedRows === 0) {
      return res
        .status(404)
        .json({ message: "Weinpaket nicht im Warenkorb gefunden" });
    }

    res.json({ message: "Weinpaket aus dem Warenkorb entfernt" });
  } catch (err) {
    console.error("Fehler beim Entfernen des Weinpakets:", err);
    return res.status(500).json({ error: err.message });
  }
};
