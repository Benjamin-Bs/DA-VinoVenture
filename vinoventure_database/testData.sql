INSERT INTO users (username, firstname, lastname, password, email, birthdate, status, role)
VALUES
('user', 'Johann', 'Müller', 'user', 'johann.mueller@gmail.com', '1990-05-14', 'active', 'user'),
('katl95', 'Katharina', 'Lechner', 'securepass1', 'katharina.lechner@gmail.com', '1995-03-20', 'active', 'user'),
('franziskahuber', 'Franziska', 'Huber', 'securepass2', 'franziska.huber@gmail.com', '1987-07-12', 'active', 'user'),
('maximilian.k', 'Maximilian', 'Klein', 'securepass3', 'max.klein@gmail.com', '1992-11-23', 'inactive', 'user'),
('lauragruber', 'Laura', 'Gruber', 'securepass4', 'laura.gruber@gmail.com', '1998-01-30', 'active', 'user'),
('lukas.k', 'Lukas', 'Koller', 'securepass5', 'lukas.koller@gmail.com', '1985-06-25', 'inactive', 'user'),
('anna.schmidt', 'Anna', 'Schmidt', 'securepass6', 'anna.schmidt@gmail.com', '1990-04-15', 'active', 'user'),
('petermaier', 'Peter', 'Maier', 'securepass7', 'peter.maier@gmail.com', '1983-09-10', 'active', 'user'),
('sabrinafischer', 'Sabrina', 'Fischer', 'securepass8', 'sabrina.fischer@gmail.com', '1997-08-18', 'active', 'user'),
('philiplang', 'Philipp', 'Lang', 'securepass9', 'philipp.lang@gmail.com', '1989-12-05', 'active', 'user'),
('marie.kaufmann', 'Marie', 'Kaufmann', 'securepass10', 'marie.kaufmann@gmail.com', '1993-03-28', 'inactive', 'user'),
('daniel.p', 'Daniel', 'Pichler', 'securepass11', 'daniel.pichler@gmail.com', '1986-07-22', 'active', 'user'),
('jacqueline.hofer', 'Jacqueline', 'Hofer', 'securepass12', 'jacqueline.hofer@gmail.com', '1994-09-14', 'active', 'user'),
('fabianbrenner', 'Fabian', 'Brenner', 'securepass13', 'fabian.brenner@gmail.com', '1991-11-19', 'inactive', 'user'),
('monika.k', 'Monika', 'Kreuzer', 'securepass14', 'monika.kreuzer@gmail.com', '1988-02-11', 'active', 'user'),
('andreasteiner', 'Andreas', 'Steiner', 'securepass15', 'andreas.steiner@gmail.com', '1984-05-30', 'active', 'user'),
('karin.obermayer', 'Karin', 'Obermayer', 'securepass16', 'karin.obermayer@gmail.com', '1996-12-03', 'active', 'user'),
('sebastian.b', 'Sebastian', 'Bauer', 'securepass17', 'sebastian.bauer@gmail.com', '1995-01-17', 'active', 'user'),
('elisabeth.schwarz', 'Elisabeth', 'Schwarz', 'securepass18', 'elisabeth.schwarz@gmail.com', '1987-10-07', 'inactive', 'user'),
('christoph.wagner', 'Christoph', 'Wagner', 'securepass19', 'christoph.wagner@gmail.com', '1992-06-02', 'active', 'user'),

('admin', 'Alexander', 'Meier', 'admin', 'alexander.meier@gmail.com', '1980-04-20', 'active', 'admin'),
('admin2', 'Verena', 'Weiss', 'adminpass2', 'verena.weiss@gmail.com', '1982-07-14', 'active', 'admin'),
('admin3', 'Bernhard', 'Eder', 'adminpass3', 'bernhard.eder@gmail.com', '1979-09-09', 'active', 'admin'),
('admin4', 'Claudia', 'Holzer', 'adminpass4', 'claudia.holzer@gmail.com', '1983-01-25', 'active', 'admin'),
('admin5', 'Thomas', 'Rauch', 'adminpass5', 'thomas.rauch@gmail.com', '1978-10-12', 'active', 'admin');

INSERT INTO shipping_address (user_id, street, house_number, postal_code, city)
VALUES
-- Regular users
(1, 'Hauptstraße', '12A', 1010, 'Wien'),
(2, 'Kirchgasse', '7', 5020, 'Salzburg'),
(3, 'Linzergasse', '34', 4020, 'Linz'),
(4, 'Münchner Straße', '21', 6020, 'Innsbruck'),
(5, 'Berggasse', '9', 8010, 'Graz'),
(6, 'Bahnhofstraße', '5', 3100, 'St. Pölten'),
(7, 'Schulstraße', '17', 3500, 'Krems an der Donau'),
(8, 'Parkstraße', '14B', 6900, 'Bregenz'),
(9, 'Seestraße', '3', 7000, 'Eisenstadt'),
(10, 'Altstadtgasse', '18', 5020, 'Salzburg'),
(11, 'Neubaugasse', '12', 7400, 'Oberwart'),
(12, 'Graben', '8', 1010, 'Wien'),
(13, 'Landstraße', '4', 4020, 'Linz'),
(14, 'Marktplatz', '20', 4050, 'Traun'),
(15, 'Zehnergasse', '13', 2700, 'Wiener Neustadt'),
(16, 'Rathausplatz', '11', 4400, 'Steyr'),
(17, 'Hofgasse', '22A', 9500, 'Villach'),
(18, 'Ringstraße', '9', 6800, 'Feldkirch'),
(19, 'Rosengasse', '19', 6850, 'Dornbirn'),
(20, 'Schlossallee', '5', 2340, 'Mödling'),

-- Admins
(21, 'Kaiserstraße', '1', 6020, 'Innsbruck'),
(22, 'Mariahilfer Straße', '101', 1070, 'Wien'),
(23, 'Spittelbergplatz', '8', 1080, 'Wien'),
(24, 'Feldgasse', '4B', 7201, 'Neudörfl'),
(25, 'Steindlgasse', '15', 8010, 'Graz');

INSERT INTO wine_packages (package_name, description, wine_count, vintner, price, suitable_for_persons)
VALUES
('Viennese Classic', 'Ein Paket mit den besten klassischen Wiener Weinen.', 6, 'Weingut Mayer am Pfarrplatz', 89.90, 4),
('Styrian Whites', 'Frische Weißweine aus der Steiermark.', 3, 'Weingut Tement', 45.50, 2),
('Burgenland Reds', 'Kräftige Rotweine aus dem Burgenland.', 4, 'Weingut Heinrich', 65.00, 4),
('Lower Austria Selection', 'Gemischte Weine aus Niederösterreich.', 5, 'Weingut Bründlmayer', 75.30, 5),
('Grüner Veltliner Premium', 'Hochwertiger Grüner Veltliner.', 3, 'Weingut Prager', 54.90, 2),
('Wachau Gold', 'Exklusive Rieslinge aus der Wachau.', 3, 'Weingut FX Pichler', 99.00, 3),
('Thermenregion Trio', 'Weine aus der Thermenregion mit Charakter.', 3, 'Weingut Reinisch', 49.90, 2),
('Kamptal Classics', 'Typische Weine aus dem Kamptal.', 4, 'Weingut Schloss Gobelsburg', 65.00, 4),
('Carnuntum Reds', 'Fruchtige Rotweine aus Carnuntum.', 3, 'Weingut Glatzer', 44.50, 3),
('Steirische Vielfalt', 'Bunte Mischung aus der Steiermark.', 5, 'Weingut Neumeister', 70.00, 5),
('Burgenland Süßweine', 'Dessertweine aus dem Burgenland.', 2, 'Weingut Kracher', 95.00, 2),
('Bio-Weine Österreich', 'Biologisch erzeugte Weine.', 4, 'Weingut Loimer', 79.90, 4),
('Junge Talente', 'Weine von jungen Winzern.', 4, 'Verschiedene Winzer', 59.90, 4),
('Wiener Heuriger Paket', 'Typische Weine vom Wiener Heurigen.', 6, 'Weingut Christ', 85.00, 6),
('Exklusive Reserve', 'Ausgewählte Reserve-Weine.', 3, 'Weingut Moric', 129.90, 3),
('Zweigelt Selection', 'Beste Zweigelt aus Österreich.', 4, 'Weingut Pfaffl', 55.00, 4),
('Südsteirische Klassiker', 'Regionale Weine aus der Südsteiermark.', 4, 'Weingut Gross', 64.50, 4),
('Rotwein Cuvée', 'Cuvée aus besten Rotweinen.', 3, 'Weingut Nittnaus', 75.00, 3),
('Grüner Genuss', 'Grüner Veltliner für jeden Anlass.', 5, 'Weingut Nigl', 49.90, 5),
('Steirische Sauvignon Blancs', 'Frische Sauvignon Blancs aus der Steiermark.', 3, 'Weingut Sattlerhof', 69.90, 3),
('Klassiker der Wachau', 'Smaragde aus der Wachau.', 3, 'Weingut Knoll', 119.90, 3),
('Familienpaket Österreich', 'Vielfältige Weine für die ganze Familie.', 6, 'Verschiedene Winzer', 89.90, 6),
('Weißwein für Genießer', 'Elegante Weißweine aus verschiedenen Regionen.', 4, 'Weingut Ott', 72.50, 4),
('Rotwein für zwei', 'Perfekt für einen romantischen Abend.', 2, 'Weingut Gernot Heinrich', 39.90, 2),
('Premium Selection Österreich', 'Das Beste, was Österreich zu bieten hat.', 6, 'Verschiedene Top-Winzer', 199.90, 6);

INSERT INTO wine (wine_name)
VALUES
('Grüner Veltliner'),
('Riesling Wachau'),
('Zweigelt'),
('Sauvignon Blanc Steiermark'),
('Blaufränkisch Burgenland'),
('Chardonnay Niederösterreich'),
('Merlot Burgenland'),
('Cabernet Sauvignon Weinviertel'),
('Pinot Noir Niederösterreich'),
('Sankt Laurent'),
('Muskateller Steiermark'),
('Welschriesling Burgenland'),
('Riesling Kamptal'),
('Syrah Burgenland'),
('Gamay Niederösterreich'),
('Weißburgunder Burgenland'),
('Rotgipfler Thermenregion'),
('Pinot Gris Südsteiermark'),
('Scheurebe Kamptal'),
('Grüner Veltliner Kamptal'),
('Blaufränkisch Mittelburgenland'),
('Sauvignon Blanc Südsteiermark'),
('Grüner Veltliner Wachau'),
('Cabernet Franc Burgenland'),
('Riesling Kremstal'),
('Grauburgunder Steiermark');

INSERT INTO wine_package_wine (wine_package_id, wine_id, quantity)
VALUES
(1, 1, 2), (1, 3, 1), (1, 4, 1), (1, 5, 1), (1, 7, 1),
(2, 4, 1), (2, 11, 1), (2, 22, 1),
(3, 3, 2), (3, 5, 1), (3, 6, 1),
(4, 1, 1), (4, 6, 1), (4, 9, 1), (4, 19, 1), (4, 12, 1),
(5, 1, 1), (5, 20, 2),
(6, 2, 1), (6, 25, 2),
(7, 17, 1), (7, 19, 1), (7, 10, 1),
(8, 1, 2), (8, 13, 1), (8, 19, 1),
(9, 3, 1), (9, 7, 1), (9, 8, 1),
(10, 4, 1), (10, 11, 2), (10, 18, 1), (10, 22, 1),
(11, 12, 1), (11, 25, 1),
(12, 1, 1), (12, 4, 1), (12, 20, 2),
(13, 3, 1), (13, 5, 1), (13, 7, 2),
(14, 1, 1), (14, 4, 2), (14, 6, 1), (14, 19, 1), (14, 22, 1),
(15, 3, 1), (15, 5, 1), (15, 8, 1),
(16, 3, 2), (16, 5, 1), (16, 21, 1),
(17, 4, 1), (17, 11, 1),  (17, 18, 2),
(18, 3, 1), (18, 5, 1), (18, 8, 1),
(19, 1, 2), (19, 20, 1), (19, 6, 1), (19, 12, 1),
(20, 4, 1), (20, 18, 2),
(21, 2, 1), (21, 13, 1), (21, 25, 1),
(22, 3, 1), (22, 5, 2), (22, 7, 1), (22, 9, 1), (22, 21, 1),
(23, 1, 1), (23, 4, 1), (23, 6, 2),
(24, 3, 1), (24, 5, 1),
(25, 2, 1), (25, 3, 1), (25, 4, 2), (25, 11, 1), (25, 19, 1);

INSERT INTO shipping_cart (user_id, quantity)
VALUES
(1, 89),     
(2, 150),    
(3, 45),     
(4, 120),   
(5, 60),   
(6, 300),   
(7, 75),     
(8, 110),    
(9, 200),    
(10, 95),   
(11, 220),  
(12, 50),  
(13, 35),   
(14, 80),    
(15, 130);   

INSERT INTO wine_packages_shipping_cart (wine_package_id, shipping_cart_id, quantity)
VALUES
(1, 1, 2),
(5, 1, 1),

-- Benutzer 2 hat drei unterschiedliche Pakete im Warenkorb
(2, 2, 1),
(6, 2, 1),
(9, 2, 2),

-- Benutzer 3 hat zwei Pakete im Warenkorb
(3, 3, 3),  -- 3x "Burgenland Reds"
(7, 3, 1),  -- 1x "Thermenregion Trio"

-- Benutzer 4 hat ein Paket im Warenkorb
(4, 4, 2),  -- 2x "Lower Austria Selection"

-- Benutzer 5 hat zwei Pakete im Warenkorb
(8, 5, 1),  -- 1x "Kamptal Classics"
(10, 5, 1), -- 1x "Steirische Vielfalt"

-- Benutzer 6 hat vier Pakete im Warenkorb
(5, 6, 2),  -- 2x "Grüner Veltliner Premium"
(6, 6, 1),  -- 1x "Wachau Gold"
(11, 6, 1), -- 1x "Burgenland Süßweine"

-- Benutzer 7 hat drei unterschiedliche Pakete im Warenkorb
(3, 7, 1),  -- 1x "Burgenland Reds"
(9, 7, 1),  -- 1x "Carnuntum Reds"
(12, 7, 1), -- 1x "Bio-Weine Österreich"

-- Benutzer 8 hat zwei Pakete im Warenkorb
(7, 8, 2),  -- 2x "Thermenregion Trio"
(13, 8, 1), -- 1x "Junge Talente"

-- Benutzer 9 hat ein Paket im Warenkorb
(14, 9, 3), -- 3x "Wiener Heuriger Paket"

-- Benutzer 10 hat drei unterschiedliche Pakete im Warenkorb
(1, 10, 1), -- 1x "Viennese Classic"
(6, 10, 2), -- 2x "Wachau Gold"
(15, 10, 1);-- 1x "Exklusive Reserve"

INSERT INTO orders (user_id, total_amount, status, shipping_cart_id)
VALUES
(1, 159.90, 'In Bearbeitung', 1),
(2, 249.80, 'Abgeschlossen', 2),
(3, 89.50, 'In Bearbeitung', 3),
(4, 145.30, 'Abgeschlossen', 4),
(5, 199.90, 'Abgebrochen', 5),
(6, 249.00, 'In Bearbeitung', 6),
(7, 99.80, 'Abgeschlossen', 7),
(8, 79.70, 'Abgebrochen', 8),
(9, 329.60, 'In Bearbeitung', 9),
(10, 49.90, 'Abgeschlossen', 10),
(11, 189.50, 'Abgebrochen', 11),
(12, 259.70, 'In Bearbeitung', 12),
(13, 169.90, 'Abgeschlossen', 13),
(14, 129.90, 'Abgebrochen', 14),
(15, 89.50, 'In Bearbeitung', 15);

INSERT INTO wine_package_reviews (wine_package_id, user_id, rating, review_text)
VALUES
(1, 2, 5, 'Exzellente Auswahl an Wiener Weinen. Sehr guter Geschmack und Preis-Leistungs-Verhältnis!'),
(2, 5, 4, 'Frische und hochwertige Weißweine aus der Steiermark. Etwas teurer, aber definitiv lohnenswert.'),
(3, 8, 3, 'Die Rotweine aus dem Burgenland sind gut, aber ich hatte mir mehr erwartet. Der Preis ist in Ordnung.'),
(4, 1, 5, 'Niederösterreich bietet eine tolle Mischung aus Weinen. Sehr gutes Paket für Weinliebhaber!'),
(5, 10, 2, 'Der Grüner Veltliner war okay, aber die restlichen Weine waren nicht nach meinem Geschmack. Zu teuer für die Qualität.');