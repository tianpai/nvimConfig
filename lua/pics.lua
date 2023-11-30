local M = {}

local wakuwaku = {
  "⠀⠀⠀  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠔⣰⣿⣟⡽⢋⡴⣿⠏⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⠹⣿⣿⣿⣿⣿⣿⣦⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
  "⠀⠀  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣾⣿⣿⡿⣡⠏⣴⡟⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⢹⣿⣿⣿⣿⡿⠏⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
  "⠀  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⢾⣿⣿⡛⣰⡏⣼⣿⡇⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡄⣿⡿⢛⣻⡅⠀⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
  "⠀ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⡟⣸⣿⣿⢠⣿⠃⣿⣿⠃⣼⢿⣿⣿⣿⣿⣿⣿⢿⣿⣿⣿⣿⣿⣿⡇⢿⡇⣿⣿⠃⢠⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
  "⠀  ⠀⠀⠀⠀⠀⠀⠀⠀⢠⣿⢃⣿⣿⠇⣾⡟⠀⣿⢇⣴⡄⢸⣿⣿⣿⡟⣿⣧⠘⣿⣿⡇⣿⢿⢻⣷⠸⣇⢿⣿⠀⠀⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡼⢹⡿⢸⣿⡿⢸⠟⣵⡿⠈⠈⠿⣷⠈⣿⣿⣿⠆⢿⣷⢀⢻⣿⡆⢹⢼⣷⣿⢀⣿⡜⢿⠦⠀⠩⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⣘⡇⣾⡿⢸⣿⡇⣠⡾⢋⣶⣦⠁⢒⡘⣷⡘⣿⣿⡄⣎⠻⡼⣧⡙⣿⣌⠘⣿⣿⢸⣿⣿⣿⣷⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
  "⠀⠀⠀⠀⠀⠀⠀⠀⣰⣿⡇⢿⣿⢸⡿⢰⣿⢡⣿⠉⣯⣄⠀⣷⣿⣿⣌⡻⢧⢹⣷⢆⣉⠠⠄⡀⢢⠹⣿⢸⣿⣿⣿⡿⢱⣦⠄⢠⣶⠀⠀⠀⠀⠀⠀⠀⠀",
  "⠀⠀⠀⠀⠀⠀⠀⣰⣿⣿⣷⢸⣿⠸⣿⢸⡏⣼⣿⠀⠟⠁⣸⣿⣿⣿⣿⣿⣷⣶⣴⡟⠿⡁⠀⢹⡎⢷⡹⢸⣿⣿⠟⣠⣿⠏⣼⢸⣿⡃⠀⠀⠀⠀⠀⠀⠀",
  "⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⡆⣿⡇⣿⢸⣿⡸⣿⣷⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⣿⣷⡀⣸⣿⢸⣇⢸⣿⡏⣸⣿⡏⣸⣿⢸⣿⡇⠀⠀⠀⠀⠀⠀⠀",
  "⠀⠀⠀⠀⠀⠀⠀⢿⣿⣿⣿⣷⠸⣷⠸⢸⣿⣷⣮⣛⣛⣋⣿⣿⣿⣿⣿⣿⣿⣿⣿⡀⠈⢠⣠⣿⡿⢸⠏⣾⢋⣴⣿⢋⣴⣿⣿⢸⣿⡏⡶⠀⠀⠀⠀⠀⠀",
  " ⠀⠀⠀⠀⠀⡇⣿⣿⣿⣿⣿⣧⡹⣧⠈⣿⣿⣿⣿⣿⣿⣿⡟⠛⠿⢿⣿⣿⣟⠿⣿⣿⣿⣿⡿⣣⡟⠜⣱⣿⠟⣴⣿⣿⣿⣿⢸⣿⠃⣟⡇⠀⠀⠀⠀⠀",
  "  ⠀⠀⠀⢘⠀⢻⣿⣿⣿⣿⣿⣷⡘⢆⠻⣿⣿⣿⣿⣿⡿⣰⣿⣿⡇⢿⣿⣿⣿⣶⣭⣭⣭⣾⡟⣠⣾⠟⣥⣿⣿⣿⣿⣿⡇⣼⡿⠸⣸⣿⡄⠀⠀⠀⠀",
  "⠀⠀⠀⠀⠀⢈⠀⠸⣿⣿⣿⣿⣿⣿⣿⡆⠀⠉⠻⢿⣿⣿⡇⣿⣿⣿⣿⢸⣿⣿⣿⣿⣿⣿⣿⢏⡼⢛⣴⣿⣿⣿⣿⣿⣿⣿⢁⣿⢡⢃⡏⣿⡇⠀⠀⠀⠀",
  "⠀⠀⠀⠀⠀⠀⠀⠀⠻⣿⣿⣿⣿⣿⣿⣿⡆⠀⠀⢰⡍⣛⠷⢭⣙⣛⣛⣸⣿⣿⣿⣿⣿⡿⠡⢊⣴⣿⣿⣿⣿⣿⣿⣿⣿⡏⣸⢇⡎⠘⡇⣿⡇⠀⠀⠀⠀",
  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⣿⣿⣿⣿⣿⣿⣿⠀⢠⣼⣷⣬⠛⣶⣬⣭⠉⡍⠋⠙⢩⣭⡍⠀⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠁⢣⡎⠀⠀⢹⣿⠃⠀⠀⠀⠀",
  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠹⣿⣿⣿⣿⣿⢣⣾⣿⣿⢿⣿⣇⢹⣻⠿⢛⣩⣭⣝⠻⣿⢁⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠋⠀⠁⠀⠀⠀⣼⡟⠀⠀⠀⠀⠀",
  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠛⢿⣿⢃⣿⣿⢿⣿⣿⣿⠉⡴⠉⠂⣾⣿⡿⢿⣷⡄⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⠁⠀⠀⢀⠀⠂⠀⠟⠀⠀⠀⠀⠀⠀",
  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢸⣿⣿⣿⣮⣛⠿⢣⠰⠧⠾⣿⣿⣿⣿⣾⣿⢸⣿⣿⣿⣿⣿⣿⠿⠛⠁⠀⠀⢀⠐⠀⡀⠄⠀⠀       ",
}

local anya = {
  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⡚⡁⠀⠀⠀⡤⠀⠀⠀⢀⠀⠀⢇⠀⠀⢀⠀⠀⠀⠀⠀⠀⡀⡀⠀⠀⠀⠀⠺⣦⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀      ",
  "⠀⠀⠀⠀⠀⠀⢀⣠⣤⣶⣾⣿⡱⠉⠁⠀⠀⢠⡟⠂⠀⡞⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢦⠀⠈⠀⠀⠐⣿⣿⣿⣿⣶⣦⣤⣄⡀⠀⠀⠀⠀⠀      ",
  "⠀⠀⠀⠀⢰⣾⣿⣿⣿⣿⣿⡟⠀⠀⠀⠂⢰⠚⠀⠄⣰⠁⠀⠀⠀⠀⠀⠀⠀⠀⢀⠀⠀⠀⠀⠀⠀⠀⢳⠀⠀⠀⠀⠘⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⡄⠀⠀      ",
  "⠀⠀⠀⠀⠈⣿⣿⣿⣿⡿⠟⠀⠀⠀⠀⠠⢿⢢⠀⠀⡎⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⠁⠐⠀⠀⠀⠀⠀⠈⢧⠀⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⠁⠀⠀      ",
  "⠀⠀⠀⠀⠀⢹⣿⣿⣿⣿⠅⠠⠀⠁⢀⣝⠢⠗⠀⠀⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⠀⠀⠀⠀⠀⠀⠈⠀⠈⢦⠀⠀⡀⢸⣿⣿⣿⣿⣿⣿⣿⣿⠃⠀⠀⠀      ",
  "⠀⠀⠀⠀⠀⠀⢿⣿⣿⡟⢅⡀⠀⠀⣰⠭⢻⠀⠀⢠⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⢺⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡄⠀⠀⠐⣻⣿⣿⣿⣿⣿⡿⠁⠀⠀⠀⠀      ",
  "⠀⠀⠀⠀⠀⠀⠘⣿⣿⢙⡏⠀⠀⠀⡿⣯⣼⠀⠀⣾⣿⣆⢀⠀⠀⠀⠀⠀⠀⠀⢹⡖⠀⠀⢰⡶⠀⠀⠀⠀⢨⣗⠀⠀⠀⢘⣿⣿⣿⣿⡟⠀⠀⠀⠀⠀⠀      ",
  "⠀⠀⠀⠀⠀⠀⠀⣿⡿⣥⠄⠀⠀⣹⣿⣙⠞⡇⠀⠈⡟⠻⣛⡀⠀⠀⢆⠀⠀⠀⢐⣷⡇⠀⢠⡿⣯⡮⠇⠀⢨⣿⠇⠀⠀⠀⡿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀      ",
  "⠀⠀⠀⠀⠀⠀⣸⡟⠄⢺⠂⠀⣄⣽⡿⠋⠀⠘⢾⣠⡇⠀⠙⠻⢖⡤⠻⣾⣆⠀⠐⠹⠘⠢⣄⣰⠈⠓⢾⣴⣣⣣⠃⠀⠐⠀⡟⠛⢽⣻⣇⠀⠀⠀⠀⠀⠀      ",
  "⠀⠀⠀⠀⠀⢠⡿⠃⠀⠸⠆⠀⢸⠟⠁⠀⠀⠀⠀⠈⠁⠀⠀⠀⠀⠁⠻⠟⡮⠑⠡⠌⡃⠀⠈⠙⠃⠀⢸⡷⠁⠫⡏⠀⠀⠀⡗⠀⠉⣻⣿⡀⠀⠀⠀⠀⠀      ",
  "⠀⠀⠀⠀⠀⣾⡇⠀⠀⠰⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⠀⠀⠀⠀⠀⠀⠀⡇⠀⠀⢴⠀⠀⠀⠺⣿⣧⠀⠀⠀⠀⠀      ",
  "⠀⠀⠀⠀⢰⣿⡁⠀⠀⠀⣡⠀⠀⠀⠀⢀⣀⣤⣤⣤⣄⣈⡑⠠⠀⠀⠀⠀⠀⠀⠀⠄⢂⣁⣤⣤⣤⣤⡄⣀⠀⠀⡇⠀⠀⡮⠀⠀⠀⣼⢿⣿⡄⠀⠀⠀⠀      ",
  "⠀⠀⠀⠀⣿⣿⣧⠀⠀⠀⠸⡦⡆⠠⠾⠗⠒⠛⠛⠛⠛⠛⠚⠓⠂⠀⠀⠀⠀⠀⠀⠚⠓⠚⠛⠛⠛⠛⠓⠒⠛⠲⢏⠀⢹⠒⠀⠀⢀⣾⣻⣿⣇⠀⠀⠀⠀      ",
  "⠀⠀⠀⢰⣿⢯⣥⠀⠀⠀⠀⢵⣗⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠰⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⠂⡠⠋⠀⠀⠀⡺⠛⢙⣿⣿⠀⠀⠀⠀      ",
  "⠀⠀⠀⣼⣿⠓⠑⠇⠀⠀⠀⠨⣻⡇⠀⠀⠀⠀⠈⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠐⠀⠀⠀⠀⠀⠀⠀⠀⣌⢲⠏⠀⠀⠀⣖⠀⠀⠸⣿⣿⡄⠀⠀⠀      ",
  "⠀⠀⠀⣿⣿⡠⠈⠘⣧⡂⠀⠀⠨⢳⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⣧⡯⠀⢀⣢⠛⠈⠀⠀⢀⡿⣿⣧⠀⠀⠀      ",
  "⠀⠀⠀⣿⣿⡷⠀⠀⠨⠲⣄⡀⠀⠈⢣⡀⠀⠀⠀⠀⠀⠛⢖⡒⠒⠒⠒⠒⠒⠒⠒⣒⡲⠛⠀⠀⠀⠀⠀⢀⣿⡛⣁⣆⡿⠉⠀⠀⠀⠀⠈⡟⣿⣿⡄⠀⠀      ",
  "⠀⠀⠀⣿⣿⣿⣣⠀⠀⠈⠨⠦⣂⠀⡀⠗⡄⠀⠀⠀⠀⠀⠀⠉⠉⠉⠛⠓⠒⠚⠉⠁⠀⠀⠀⠀⠀⠀⢀⣾⣷⣺⠿⠁⠀⠀⠀⠀⠀⠠⣲⣰⣿⣿⡇⠀⠀      ",
  "⠀⠀⠀⣿⣿⣿⣿⣾⠀⠀⠀⠈⠀⠁⠳⠤⠬⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⡾⣼⠟⠉⠀⠀⠀⠀⠀⠀⣠⣿⣿⣿⣿⣿⡇⠀⠀      ",
  "⠀⠀⠀⢹⣿⣿⣿⣿⣿⣆⢀⠀⠀⠀⠀⠀⠀⢹⣿⣿⣶⣶⣤⣤⣤⣀⣀⣀⣀⣀⣤⣤⣤⣴⣶⣾⣿⣿⡻⠉⠀⠀⠀⠀⠀⠀⣀⣵⣿⣿⣿⣿⣿⣿⡇⠀⠀      ",
  "⠀⠀⠀⠀⢿⣿⣿⢻⣿⣿⣿⣧⣄⠀⠀⠀⠀⠀⠘⣻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠛⠀⠀⠀⠀⠀⢀⣰⣾⣿⣿⣿⣿⣿⣿⣿⣿⠁⠀⠀      ",
}

local anya2 = {
  "⠀⠀⠀⠀⠀⠀⠀⠘⣿⣿⣿⣿⡟⢁⣾⠃⠀⠀⠀⠀⠀⢀⠊⠀⠀⠀⠀⠀⠀⢰⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠑⡀⠀⠀⠀⠀⠀⠘⣷⡘⢻⣿⣿⣿⣿⠇⠀⠀⠀⠀⠀⠀⠀   ",
  "⠀⠀⠀⠀⠀⠀⠀⠀⢻⣿⣿⣿⢀⣾⡇⠀⠀⠀⠀⠀⢀⠎⠀⠀⢠⠀⠀⠀⠀⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠐⡀⠀⠀⠀⠀⠀⢘⣷⡀⣿⣿⣿⡟⠀⠀⠀⠀⠀⠀⠀⠀   ",
  "⠀⠀⠀⠀⠀⠀⠀⠀⠈⣿⣿⣿⣿⠏⡇⠀⠀⠀⠀⠀⠌⠀⠀⠀⡄⠀⠀⠀⢠⠇⠀⠀⠀⠀⠀⠀⠀⢰⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢃⠀⠀⠱⠀⠀⠀⠀⠀⠘⠸⣿⣿⣿⣿⠁⠀⠀⠀⠀⠀⠀⠀⠀   ",
  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣿⣿⡟⠀⠀⠀⠀⠀⠀⡜⠀⠀⠀⠀⡇⠀⠀⢀⠃⠀⠀⠀⠀⠀⠀⠀⠘⠀⠀⠀⠀⣆⠀⠀⠀⠀⠀⠀⠈⡀⠀⠀⢃⠀⠀⠀⠀⠀⡆⢹⣿⣿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀   ",
  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣿⠃⢰⠀⠀⠀⠀⢠⠁⠀⠀⠀⢀⡇⠀⠀⡌⠉⡆⠀⠀⠀⠀⠀⠀⠀⠇⣇⠀⠀⠸⢂⡀⠠⡀⠀⠀⠀⢃⠀⠀⠈⡄⠀⠀⠀⠀⡇⠀⣿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀   ",
  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⠀⠀⠀⠀⠀⠀⡌⠀⠀⠀⠀⠎⢠⠀⢠⠀⠀⢡⠀⠀⠀⡀⠀⠀⠀⠘⣨⠢⡀⠀⢣⠑⢄⠑⡄⠀⠀⢸⠀⠀⠀⢰⠀⠀⠀⠀⡇⠀⢛⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀   ",
  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠋⠀⠀⡀⠀⠀⠀⠃⠀⠀⠀⠌⠀⠀⠆⢀⠀⠀⠀⢂⠀⠀⠰⡀⠀⠀⠀⠩⡄⠈⠢⡀⠡⡀⣈⠪⢄⠀⢸⠀⠀⠀⠈⠀⠀⠀⠀⠃⠀⢸⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀   ",
  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡼⠀⠀⠀⠇⠀⠀⢠⠀⠀⢀⠌⠠⣢⣭⠾⠴⠦⣌⣢⡀⠡⡀⠀⢋⠠⣀⠀⠀⠱⡀⢀⣔⣱⠴⠶⠶⢬⡄⡦⣆⠀⠀⠀⡇⠀⠀⠀⠀⠀⠈⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀   ",
  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⣐⠃⢸⠀⠀⢰⠀⠀⢸⠀⡠⡪⣲⠟⠁⠀⠠⣤⣤⡀⠙⣖⠀⠀⠁⠂⠱⠀⠉⠐⠂⠐⢰⠏⠁⠤⣤⣤⡀⠰⠻⣮⢆⠀⠀⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀   ",
  "⠀⠀⠀⠀⠀⠀⠀⠀⠰⠸⠀⠈⡄⠀⠀⡆⠀⢸⠔⠑⣴⠋⠀⢀⠀⢀⣿⣿⣿⡄⠘⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠆⢀⠀⢠⣿⣿⣿⡄⠀⠘⣧⠓⢄⡇⠀⢀⠀⠀⠀⠀⠀⠀⢀⠀⠀⠀⠀⠀⠀⠀⠀   ",
  "⠀⠀⠀⠀⠀⠀⠀⢠⠙⡆⠀⠀⢡⠀⠀⠰⠀⠘⠈⢰⡟⠀⠀⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⣿⣷⠀⠀⢹⡆⠁⠇⠀⡌⠀⠀⠀⠀⠀⠸⢃⠆⠀⠀⠀⠀⠀⠀⠀   ",
  "⠀⠀⠀⠀⠀⠀⢀⠂⠃⠁⠀⠀⠀⠣⠀⠀⢃⠀⡈⣹⡇⠀⠀⣿⣿⣿⣿⡏⡿⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⡿⣿⠿⠀⠀⢸⣏⣉⠀⡘⠀⠀⠌⠀⠀⠀⠀⡎⡘⡀⠀⠀⠀⠀⠀⠀   ",
  "⠀⠀⠀⠀⠀⠀⠄⠘⢸⠀⠀⠀⠀⠀⠡⡀⠀⢂⠇⠠⢷⠀⠀⢻⡿⠉⠛⠁⢻⠆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⣿⠁⠉⠁⢹⡖⠀⠀⡸⠄⠸⡰⠀⢀⠌⠀⠀⠀⠀⠀⠃⢇⢁⠀⠀⠀⠀⠀⠀   ",
  "⠀⠀⠀⠀⠀⠀⠀⠀⠈⠀⠀⠀⠀⠀⠀⠐⢄⠀⢺⠀⠈⠂⠀⠀⠑⠠⠤⠄⠊⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⠠⠤⠄⠊⠀⠀⠐⠁⠀⡶⠁⡠⠊⠀⠀⠀⠀⠀⠀⢰⢸⡌⡀⠀⠀⠀⠀⠀   ",
  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠱⡀⢃⠀⠀⠀⠂⠄⠠⠀⠀⠀⠀⠀⠀⠀⠀⢀⡀⢀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⠀⠀⠀⠀⡘⢁⠔⠁⠀⠀⠀⠀⠀⠀⠀⢸⢸⡇⢀⠀⠀⠀⠀⠀   ",
  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢢⠡⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⠁⠀⠀⠀⣑⡄⠀⠀⠀⠀⠀⠀⠀⠀⠐⠀⠐⡜⡐⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⢸⣿⢈⠀⠀⠀⠀⠀   ",
  "⠀⠀⠀⠀⠀⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠐⢥⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⠋⠀⠀⠀⠀⠀⠀⠙⠄⠀⠀⠀⠀⠀⠀⠀⠀⠀⡼⠊⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣸⣸⣿⢰⠀⠀⠀⠀⠀   ",
  "⠀⠀⠀⠀⠀⢀⢀⡀⣆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠣⠀⠀⠀⠀⠀⠀⠀⠀⡄⠀⠀⠀⠀⠀⠀⠀⠀⢰⠀⠀⠀⠀⠀⠀⠀⠀⠜⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣿⣿⣿⡀⠀⠀⠀⠀⠀   ",
  "⠀⠀⠀⠀⠀⠈⣼⣷⣿⣇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠱⠀⠀⠀⠀⠀⠀⠀⡇⠀⠀⠀⠀⠀⠀⠀⠀⢸⠀⠀⠀⠀⠀⠀⠀⡌⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣾⣿⣿⣯⠁⠀⠀⠀⠀⠀   ",
  "⠀⠀⠀⠀⠀⠀⠘⢿⣿⣿⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢡⡀⠀⠀⠀⠀⠀⠐⢀⠀⠀⠀⠀⠀⠀⡀⠌⠀⠀⠀⠀⠀⠀⡘⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⣿⣿⣿⠃⠀⠀⠀⠀⠀⠀   ",
  "⠀⠀⠀⠀⠀⠀⠀⠀⠻⣿⣿⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⡤⠉⢔⢂⠤⠤⠄⠀⢈⣁⣀⣂⣀⡉⠀⠀⠤⡤⠒⢆⠝⢣⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⣿⡿⠁⠀⠀⠀⠀⠀⠀⠀   ",
  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢿⣿⣧⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠃⠀⡠⠋⠢⢄⡘⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠧⠂⠃⠄⠸⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡀⠀⠀⡠⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀   ",
  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠻⣿⣿⣷⣄⡀⠀⠀⠀⠀⡀⠄⠒⠈⠉⠢⡁⠀⠠⠂⠈⠁⡐⠒⠒⡖⠒⠒⡖⠈⠁⠢⠀⠔⠈⠀⠒⠂⠤⣀⠀⠀⠀⠀⢀⣤⣾⣿⣿⠖⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀   ",
  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠻⣿⣿⣿⣷⣤⣠⠂⠀⠈⠉⠉⠀⠀⠲⢄⠀⠀⠀⠀⠁⠀⠀⠁⠀⠀⠀⠀⠀⠰⢸⠀⠂⠉⠀⡀⠀⠀⢂⣠⣴⣾⣿⣿⣿⡟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀   ",
  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⠉⠀⠒⠠⡀⣯⣆⠀⠀⢡⠀⠀⡇⠀⠀⠀⠀⠀⠋⢀⠠⠒⠈⠀⡀⠀⠀⠘⣿⣿⣿⣿⣿⣿⣷⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀   ",
  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⣿⣿⣿⣿⣿⣿⠃⠀⠀⠀⠀⠂⠠⠄⢀⣘⣿⣿⣄⠀⠈⠀⠀⡆⠀⠀⡇⣀⣴⡤⢼⢀⠤⠊⠁⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀   ",
  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⣿⣿⣿⣿⡿⢫⠀⠀⠀⠀⠀⠀⠀⠀⣸⣿⣿⣿⣿⣿⣿⣿⣶⣶⣶⣾⣿⣿⣿⣿⣿⣇⠀⣀⡠⠀⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀   ",
}

local anya3 = {
  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿      ",
  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠿⠟⠛⠛⠛⠉⠉⢉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠉⠉⠛⡟⠛⠻⠿⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿      ",
  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢱⠀⠀⠀⠀⠀⠀⠉⠉⠉⠛⠛⡿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿      ",
  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣇⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡇⠀⠀⠈⠙⡟⠻⠿⣿⣿⣿⣿⣿⣿⣿⣿      ",
  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡄⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⡄⠀⠀⠀⠀⢣⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠃⠀⠀⠀⠀⢱⠀⠀⠀⠉⠹⡛⠿⣿⣿⣿      ",
  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⠀⠀⠀⠀⠀⠀⠀⠀⡿⣿⣷⡀⠀⠀⠀⠘⡄⠀⠀⠀⠀⠀⠀⠀⠀⡄⠀⠀⠀⠀⢱⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⠀⠀⠀⠀⠀⢸⡆⠀⠀⠀⠀⢱⠀⠀⠙⣿      ",
  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⣿⣿⣿⣿⣿⣿⣆⠀⠀⠀⠀⠀⠀⠀⡇⢿⣿⣷⠀⠀⠀⠀⢙⢆⠀⠀⠀⠀⠀⠀⠀⠸⡀⠀⠀⠀⢸⠀⠀⠀⠀⠀⠀⠀⠀⠀⡸⠀⠀⠀⠀⠀⡇⢱⠀⠀⠀⠀⠀⢇⠀⠀⢻      ",
  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠸⣿⣿⣿⣿⣿⣿⣆⠀⠀⠀⠀⠀⠀⠁⠈⢻⣿⣧⡀⠀⠀⠘⡤⠕⢄⠀⠀⠀⠀⠀⠀⢣⠀⠀⠀⢸⠀⠀⠀⠀⠀⠀⠀⠀⢀⠇⠀⠀⠀⠀⢸⠀⠘⣆⠀⠀⠀⠀⠈⡆⠀⠀      ",
  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡏⠲⣄⡹⣿⣿⣿⣿⣿⣿⣦⠀⠀⠀⠀⠀⢸⠀⠀⠙⣿⣷⡄⠀⠀⠱⠀⠈⠑⢄⡀⠀⠀⠀⠀⣦⠀⠀⢸⡆⠀⠀⠀⠀⠀⠀⠀⡸⠀⠀⠀⠀⢀⠆⠀⠀⣿⣆⠀⠀⠀⠀⢰⡀⠀      ",
  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠁⢿⣿⣇⣀⠀⠙⠻⢿⣿⣿⣿⣿⣿⣷⣄⠀⠀⠀⠘⠤⠒⢚⠩⠿⣿⣆⡀⠀⢗⠀⠀⠄⠌⠒⢄⡀⠀⢱⠱⡀⢸⡇⠀⠀⠀⠀⠀⠀⢠⠃⠀⠀⠀⢀⠎⠀⠀⠀⢸⣿⣆⠀⠀⠀⠀⢧⠀      ",
  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢠⠜⠻⡇⠀⠉⠁⠒⠠⢽⣻⢷⡙⠻⣿⣿⣷⣤⡀⠀⡧⠀⠁⠀⠀⠈⠛⠷⣄⠈⢂⠀⠀⠀⠀⠀⠈⠑⠸⠂⠈⣼⣿⠀⠀⠀⠀⠀⢀⠃⠀⠀⠀⢀⠞⠀⠀⠀⠀⢸⣿⣿⡆⠀⠀⠀⠘⡄      ",
  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢀⣀⠠⠥⠤⣀⣀⣀⣀⠀⢀⡀⠀⠀⠀⠉⠉⠛⠛⠒⠚⣒⣒⣒⣶⣶⣶⣶⣤⣭⣭⣤⣿⣶⣶⣶⣾⣿⠛⠋⠁⣿⣿⠀⠀⠀⠀⢀⠎⠀⠀⠀⢠⠎⠀⠀⠀⠀⠀⢸⣿⣿⣷⠀⠀⠀⠀⢣      ",
  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣯⠋⠛⠻⠿⠿⠿⠿⠿⣿⣿⣿⠿⠂⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠙⠛⠋⠉⠉⠉⠉⠉⠉⠀⠈⠻⠿⠿⠁⡠⠎⠀⣿⣿⠀⠀⠀⠀⠌⠀⠀⠀⡰⠁⠀⠀⠀⠀⠀⠀⠘⣿⣿⣿⣇⠀⠀⠀⠘      ",
  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠣⡀⠀⠀⠀⠀⠀⠙⠛⢁⠔⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠒⠤⣀⡀⠀⠀⠀⠀⠀⠀⠀⢀⡀⠠⠐⠉⠀⠀⢰⣿⣿⠀⠀⢀⠎⠀⠀⢀⠎⠀⠀⠀⠀⠀⠀⠀⠀⢀⣿⣿⣿⣿⠀⠀⠀⠀      ",
  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠛⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡄⠀⠙⠳⠦⠤⠤⠤⠐⠊⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠑⠒⠒⠂⠈⠈⠀⠀⠀⠀⠀⠀⠀⣾⣿⡟⠀⡤⠃⠀⢀⠔⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⡄⠀⠀⠀      ",
  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠻⣿⣿⣿⣿⣿⣿⣿⣇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⣿⣿⣧⠎⠀⢀⠔⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⡇⠀⠀⠀      ",
  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠱⡙⢿⣿⣿⣿⣿⣿⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣿⣿⣿⠃⢀⠔⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⡇⠀⠀⠀      ",
  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠱⡄⠙⡿⣿⣿⣿⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡠⠜⠀⠀⠀⠀⠀⠀⣾⣿⣿⣿⠜⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⣿⣿⣿⣿⡇⠀⠀⠀      ",
  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣄⠈⢮⠻⣿⣿⡄⠀⠀⠀⠀⠀⠀⠀⡰⠂⢄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡠⠔⠈⠀⠀⠀⠀⠀⠀⠀⣼⣿⣿⣿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⠻⣿⣿⣿⣿⡇⠀⠀⠀      ",
  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢣⡀⠳⡈⠻⢿⡀⠀⠀⠀⠀⠀⠀⠇⠀⠀⠡⠀⠀⠀⠀⠀⠀⠀⠠⠄⠒⠂⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⣿⣿⣿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡜⠀⢿⣿⣿⣿⡇⠀⠀⠀      ",
  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡇⠀⠀⠀⠀⠀⠀⠀⠀⠑⢄⠘⢦⠀⠱⡄⠀⠀⠀⠀⠀⢰⠀⠀⠀⡂⠀⠀⡀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⣿⣿⣿⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣴⠀⠀⢠⠁⠀⠘⣿⣿⣿⠀⠀⠀⠀      ",
  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣡⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠑⢄⠑⢄⠈⠢⣄⠀⠀⠀⢸⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣾⣿⣿⣿⠏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣾⣿⠀⢠⠇⠀⠀⠀⢿⣿⡿⠀⠀⠀⠀      ",
  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⣆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠑⢄⠑⢄⠀⠙⠢⢄⣸⠀⠀⠀⢸⠀⠀⠀⠀⢀⠠⠠⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⣿⣿⣿⣿⠏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⣿⣿⠏⢀⠆⢸⡄⠀⠀⠘⣿⠃⠀⠀⠀⠀      ",
  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠤⡑⣄⠀⣸⣿⠀⠀⠀⢸⣤⣤⣀⣠⠃⠀⠀⢰⣀⣀⣀⣤⣤⡤⠖⢊⣽⣿⣿⣿⣿⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣾⣿⣿⠏⣠⡏⠀⢸⣿⡄⠀⠀⢹⠀⢀⠄⠀⠀      ",
  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⠆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠺⣦⣿⡇⠀⠀⠀⢸⣿⣿⣿⡏⠀⠀⠀⣾⣿⣿⣿⣿⠁⠀⢀⣾⣿⣿⣿⣿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣰⣾⣿⣿⣿⢏⣴⣿⡇⠀⢸⣿⣿⣦⡀⠀⢳⠿⠷⣄⣴      ",
  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠢⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⢿⠇⠀⠀⠀⢸⣿⣿⣿⡇⠀⠀⠀⣿⣿⣿⠏⠀⣧⢀⣿⣿⣿⣿⣿⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣴⣿⣿⣿⣿⡿⡇⠀⠈⣿⡇⠀⡎⠻⣿⣿⣿⣦⣀⠣⣰⣿⣿      ",
  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠢⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⠀⠀⢀⢀⠼⠿⣟⣛⢿⠀⠀⠀⢹⣿⠃⢀⡼⢴⣿⣿⣿⣿⣿⡏⠀⠀⠀⠀⠀⠀⠀⢀⣤⣾⣿⣿⣿⣿⣿⡟⠋⠀⠀⢀⣿⡇⢰⠁⢀⣼⣿⣿⣿⣿⣿⣿⣿⣿      ",
}

local Reina_Aharen = {
  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡀⠀⠀⠀⠀⠀⠀⠌⠀⠀⠀⠀⠀⠀⠀⠀⠀⡰⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠌⠀⡀⠀⠀⠀⠀⠌⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⠀⠀⠀⠀⠀⠀⠇⠀⠀⠀⠀⠀⠀⠀⠀⠡⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠀⠀⡐⠀⠀⠀⠀⠌⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⠀⠀⠀⠀⠀⠀⢰⠀⠀⠀⠀⠀⠀⠀⠀⠀⠡⠀⠀⠀⠀⠀⠀⠀⠀⠀",
  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⠁⠀⠀⠀⡘⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡌⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠀⠀⠀⠀⠀⠀⠀⡀⠀⠀⠀⠀⠀⠀⡇⠀⠀⢀⠀⠀⠀⠀⠀⠀⠀⠀",
  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠄⠀⠀⡌⠀⠀⠀⠰⠀⠀⠀⠀⠀⠀⠀⠀⠀⡀⢀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠇⠀⠀⠀⠀⠀⠀⠀⡇⠀⡀⠀⠀⠀⠀⡇⠀⠀⠈⡀⠀⠀⠀⠀⠀⠀⠀",
  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠐⠀⠀⠰⠀⠀⠀⠀⢇⠀⠀⠀⠀⠀⡆⠀⠀⠀⠃⠘⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠃⠀⠀⠀⠀⡇⠀⠀⠀⠁⠀⠀⠀⠀⠀⠀⠀",
  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡆⠀⠀⠀⢸⢸⠀⠀⠀⠀⠀⠁⠀⠀⢰⠀⡆⠀⠀⠀⠀⠀⠀⡀⠀⠀⠀⠀⠀⠀⠘⠀⠀⠀⠀⠀⠀⠀⠀⡖⠀⠀⠀⠀⡆⠀⠀⠀⠀⠀⠘⠀⠀⠀⠀⠀⠀⠀",
  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⠀⠀⠀⠀⠈⣎⠀⠀⠀⠀⢠⠀⠀⠀⢸⠀⠁⡄⠀⠀⠀⠀⢀⠁⠀⠀⠀⠀⠄⠀⡆⠀⠀⠀⢰⠀⠀⠀⠀⣧⠡⠀⠀⣔⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⠀⠀⠀⠀⢰⣿⣴⣶⣆⣄⣼⣦⣀⣀⣸⣸⡄⣆⠀⠀⠀⠰⠸⠀⠀⠀⠀⢠⠀⢰⡇⠀⠀⠀⣸⠀⠀⠀⢴⢻⣧⡇⠀⣿⡇⢰⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠂⠀⠀⠘⠀⠀⠀⠀⠸⡏⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢻⣿⣿⣿⣿⣿⣿⣶⣶⣶⣦⣾⣄⢿⣇⡀⠀⢀⡟⠀⠀⢰⡞⠈⢿⡇⠀⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡇⠀⠀⠀⠀⠀⠁⠀⠁⠀⠈⠀⠀⠉⠉⠉⠉⠘⠋⠛⠿⠿⢿⣿⣿⣿⣿⣟⣿⠏⣿⣿⣿⣿⣿⣿⣷⣶⣾⠓⠀⠀⢣⠀⣿⠀⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡇⠀⠀⠀⠀⢰⠀⣠⠴⠶⠶⢿⣿⣿⣿⣿⣶⣆⠀⠀⠀⠀⠀⠀⠀⠁⠉⠈⠀⠘⠘⠙⠿⠿⠿⣿⢿⢃⠏⠀⠀⠀⠘⠀⠛⠀⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡇⠀⠀⠀⠀⢸⠀⠀⠀⠀⢠⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⢷⣶⣶⣦⣤⣀⠈⠀⠀⠀⠀⠀⡃⡇⢰⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠁⠀⠀⠀⠀⢸⠀⠀⠀⠀⣾⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⣿⣿⣿⣿⣿⠿⣶⣤⡀⠀⠀⢸⠀⢸⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⠀⠀⠀⠀⢿⠛⠓⠛⡫⠟⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣸⣿⣿⣿⣿⣿⣿⠀⠀⠈⠙⠀⠀⠸⠀⣼⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⠀⠀⠀⠀⠈⠀⠂⠀⠀⠚⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⠏⢿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⡄⠀⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠁⠤⠁⠀⠐⣡⠃⠀⠀⠀⠀⠀⢸⠁⢠⢸⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠐⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠀⠀⠀⠀⠀⠀⢠⢿⠀⠸⣸⠀⠀⠀⢰⠀⠀⠀⠀⠀⠀⠀⠀⠀",
  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣿⡿⠀⢧⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⢇⡿⠂⢠⣿⣿⠀⠀⠀⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀",
  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡆⠀⠀⠀⠀⣿⣷⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣃⣡⣴⡇⢸⣿⡿⠀⠀⠠⢀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡇⠀⠀⠀⠀⣿⣿⣿⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣿⣿⣿⣿⡇⣾⣿⡇⠀⠀⠀⠘⠀⠀⠀⠀⠀⠀⠀⠀⠀",
  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣤⣔⡇⠀⠀⠀⠀⣿⣿⣿⣿⣷⣦⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⣿⣿⣿⣿⣿⢃⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣧⡀⠀⠀⠀⣿⣿⣿⣿⡿⠃⢸⢁⡆⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣤⣦⣿⣿⣿⣿⣿⣿⣿⢸⣿⣿⣿⠀⠀⠀⠀⢰⠀⠀⠀⠀⠀⠀⠀⠀",
  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣿⣿⣿⣿⣿⣶⣄⣀⣿⣿⣿⠟⠁⠀⠸⣾⣿⣾⣾⣷⣦⡤⡀⣀⠀⠀⢀⣀⣀⣀⣤⠤⣶⣶⣿⣿⣿⣿⣿⣿⡿⢳⣿⣿⣿⣼⣿⣿⢻⣀⠀⠀⠀⢿⠀⠀⠀⠀⠀⠀⠀⠀",
  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⠀⠀⠀⠀⠹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣿⣿⣿⡮⠁⠀⠈⢿⣿⣿⣿⣿⣿⣏⢀⣾⣿⣿⣿⣿⣿⡟⢸⣿⣿⡇⠀⢸⡄⠀⠀⠀⠀⠀⠀⠀",
  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⡿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠙⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡃⠀⠀⠀⠀⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠃⢸⣿⣿⡇⠀⢸⡇⠀⠀⠀⠀⠀⠀⠀",
  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⡇⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠘⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠹⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⡎⠀⢸⣿⣿⠀⠀⢘⡇⠀⠀⠀⠀⠀⠀⠀",
}

local Reina_Aharen2 = {
  " ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠔⠉⠀⠀⠀⠀⢀⡁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣀⣀⣀⣀⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠇⢠  ",
  " ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣧⡀⠀⠀⠀⠀⣠⣾⣿⠀⠀⠀⠀⠀⠀⠀⢀⠠⠒⠊⠁⠀⠀⠀⠀⠀⠀⠀⠉⠐⠢⢀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⠀⠀ ",
  " ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣷⣾⣷⣀⣤⣾⣿⣿⣦⠀⠀⠀⠀⡠⠊⠀⠀⠀⠀⠀⠀⠀⢀⠀⠀⠀⠀⠀⠀⢁⠀⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⣿⠀  ",
  " ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⢀⠈⠀⠀⡄⠀⠀⡜⠀⠀⠀⢰⠀⠀⠀⠀⠀⠀⠈⡦⡀⠀⠈⢀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣾⣿⣿⣆⠀",
  " ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⢀⢧⠀⠀⠀⡌⡄⠀⠀⠀⡇⠀⢰⠧⣀⠀⠀⠀⢂⠀⠀⠀⠀⠀⠀⠀⣰⣿⣿⣿⣿⣿⣷",
  " ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣟⠀⡇⠀⢸⡀⠀⣸⢸⠀⠀⠀⡇⡇⠀⠀⠀⡇⠀⠈⣾⠈⢆⠀⠀⡆⠄⠀⠀⠀⠀⠀⣰⣿⣿⣿⣿⣿⣿⣿",
  " ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠲⣶⣶⣤⣤⣤⣄⣀⣀⠀⠀⠀⠈⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⢸⡇⡀⣿⢺⠀⠀⢠⣿⡇⡇⠀⠀⡇⠀⢠⡏⠀⠀⠡⣸⢰⠀⠀⠀⠀⠀⢰⣿⣿⣿⣿⣿⣿⣿⣿",
  " ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣤⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡆⠀⠀⢈⡳⠦⢟⣛⣁⣉⣉⠉⠉⠉⠀⠁⠉⣉⣍⣁⡀⠀⠀⢩⢸⠀⠀⠀⠀⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿",
  " ⠀⠀⠀⠀⠀⠀⠀⢀⣤⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⡀⠀⠀⡗⠛⢹⣿⠿⣿⡏⠀⠀⠀⠀⠀⠀⢠⣿⣿⣿⡝⠒⢸⢸⡄⠀⠀⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
  " ⠀⠀⠀⠀⣀⣤⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⡇⠀⠸⢐⡀⠠⠃⠀⠀⠀⢀⠀⠀⠘⢀⠀⠸⠃⠀⢸⢸⡇⢀⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟",
  " ⠀⠠⠴⠾⠿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⢸⣧⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠏⠀",
  " ⠀⠀⠀⠀⣰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⡀⠀⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠃⠀⠀",
  " ⠀⠀⠀⣰⣿⣿⣿⣿⣿⣿⣿⠁⢻⣿⣿⣿⣿⣿⣿⣿⡟⠉⣿⡟⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⠀⠀⠀⠀⠀⠀⠀⠀⢸⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠁⠀⠀⠀",
  " ⠀⠀⣴⣿⣿⣿⣿⣿⡿⢻⢃⠀⠀⢿⣿⣿⣿⣿⡿⠋⢀⡀⢿⠃⠀⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢃⠀⢰⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣿⢸⣿⣿⣿⣿⣿⣿⣿⣿⡟⠁⠀⠀⠀⠀",
  " ⠀⣼⣿⣿⣿⣿⣿⣿⠃⠈⠀⠈⠑⠚⣿⣿⣿⠟⠁⠈⠁⠀⠀⠀⠀⠀⠹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠀⢘⣿⣷⡢⢄⡀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⣴⣾⣿⣿⢸⣿⣿⣿⣿⣿⣿⣿⡟⠀⠀⠀⠀⠀⠀",
  " ⡼⠟⣿⣿⣿⣿⣿⠏⠀⢀⣀⣤⣤⠀⢸⠟⠁⠀⠀⠠⢲⣦⣤⡤⢀⠀⠀⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⡄⢸⣿⣿⣿⡀⠈⠑⢲⡆⠀⢀⢔⠒⠉⢸⣿⣿⣿⣿⣿⢸⣿⣿⣿⣿⣿⣿⡿⠁⠀⠀⠀⠀⠀⠀",
  " ⠀⠀⢹⣿⣿⣿⡏⠀⠊⠁⠉⠛⠁⠀⠀⠀⠀⠀⠀⠀⠀⠈⠁⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⣼⣿⣿⣿⣷⡀⡰⠱⣱⣀⡎⠇⣧⡀⣸⣿⣿⣿⣿⣿⣼⣿⣿⣿⣿⣿⠋⠀⠀⠀⠀⠀⠀⠀⠀",
  " ⠀⠀⢸⡟⡿⣻⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣯⢿⣿⣿⣿⣿⣿⣿⣿⡇⣿⣿⣿⣿⣿⣿⣆⠀⠀⢹⠀⢠⣿⣿⣿⣿⣿⣿⣿⣏⣿⣿⣿⣿⡿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀",
  " ⠀⠀⢸⠁⠘⢹⣷⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⠉⡷⣸⣿⣿⣿⣿⣿⣿⣿⣧⢹⣿⣿⣿⣿⣿⣿⣦⠀⠸⠀⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
  " ⠀⠀⠀⠀⠀⠨⡟⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⠀⡇⠘⣿⣿⣿⣿⣿⣿⣿⣿⣸⣿⣿⣿⣿⣿⣿⣿⣧⡀⣰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
  " ⠀⠀⠀⠀⠀⠀⠹⡙⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣸⢀⡇⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
  " ⠀⠀⠀⠀⠀⠀⠀⠀⠡⠀⠀⠀⠀⠀⠀⠀⠁⠁⠀⠀⠀⠀⠀⠀⠀⢀⣼⡇⢸⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
  " ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢤⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡠⢶⠁⢸⠇⢸⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡣⠄⠀⠤⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
  " ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⠹⢦⣀⠀⠀⠀⠀⠀⠀⣠⡴⠫⢈⠇⠀⢸⠀⡏⠀⠀⣿⡿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡫⠁⠀⠀⠀⠀⠈⠑⢄⠀⠀⠀⠀⠀⠀⠀",
  " ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⠀⠀⢻⣷⣤⣤⣤⠴⠞⡋⠀⠀⡜⠀⠀⢰⠈⠀⠀⠀⢋⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠏⠀⠀⢒⡂⠠⢄⡀⠀⠀⠁⠀⠀⠀⠀⠀⠀",
  " ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⣀⣀⣀⣝⣿⠋⠐⠀⢀⣀⣀⣐⣀⣀⣀⣸⠀⠀⠀⠀⠘⡄⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠿⠿⠿⢓⠴⢒⣄⠀⠈⠉⠉⠚⠢⡀⠐⢆⠀⠀⠀⠀⠀",
  " ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠁⠀⠀⣮⣍⣯⣅⣀⣴⣯⣷⡀⠀⠀⠀⠀⢸⠀⠀⠀⠀⠀⢧⣹⣿⣿⣿⣿⠿⣿⣿⣿⠿⠟⡛⠿⠛⠋⠉⠉⠀⠀⠀⠀⠀⠀⢀⠀⠐⢌⠑⠢⠄⡀⠀⠀⠘⢄⠈⡀⠀⠀⠀⠀",
  " ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡘⠛⣿⣿⣿⣿⣿⡟⠛⢃⠀⠀⠀⠀⢸⠀⠀⠀⠀⠀⠸⡁⢟⠋⠀⠀⠀⣾⣿⠿⢋⡔⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠎⠀⠀⠀⠑⢄⠀⠀⠀⠀⠀⠈⡆⠃⠀⠀⠀⠀",
  " ⠀⠀⠀⠀⠀⢀⠀⠈⠸⠢⡀⠰⡁⠀⠘⣿⣿⣿⡏⠀⠀⠈⡀⠀⣀⠤⢺⠀⠀⠀⠀⠀⠀⡧⢸⠀⠀⠀⣴⡿⠁⢠⠊⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠎⠀⠀⠀⠀⠀⠈⢂⠀⠀⠀⠀⠀⡟⠀⠀⠀⠀⠀",
  " ⠀⠀⠀⠀⠀⠈⡆⠀⠀⠁⠑⠁⠀⠤⡀⣿⣿⣿⡃⡠⠄⠀⠑⡨⠃⠀⢸⠀⠀⠀⠀⠀⠀⢻⣸⠀⢀⠔⠉⡇⡠⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠂⠄⠀⠀⠀⠀⠀⠀⠀⢣⠀⠀⠀⠘⠁⠀⠀⠀⠀⠀",
  " ⠀⠀⠀⠀⠀⠀⢻⡄⠀⠀⠱⡀⠀⠀⠀⣿⣿⣿⡏⠀⠀⠀⠐⠁⠀⢀⠎⠀⠀⠀⠀⠀⠀⢘⠎⡠⠁⠀⠀⢳⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡜⠀⠀⠀⠀⠀⠀⠀⠀⠀⠂⠀⠀⠀⠀⠀⠀⠀⠀⠀",
}

local all = { wakuwaku, Reina_Aharen, Reina_Aharen2, anya, anya2, anya3 }

function M.get_all()
  return all, #all
end

return M
