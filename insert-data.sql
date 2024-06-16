
INSERT INTO tbl_regions (id, name) VALUES 
(1, 'North America'),
(2, 'Europe'),
(3, 'Asia');

-- Insert into tbl_countries
INSERT INTO tbl_countries (id, name, region) VALUES 
('USA', 'United States', 1),
('CAN', 'Canada', 1),
('GBR', 'United Kingdom', 2),
('DEU', 'Germany', 2),
('CHN', 'China', 3),
('JPN', 'Japan', 3);