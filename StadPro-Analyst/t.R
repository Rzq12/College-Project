require(tcltk)
require(tcltk2)
require(DescTools)

dataSource <<- 0

window <- tktoplevel()

# Modern Color Palette - Professional Blue Theme
primary_blue <- "#2C3E50"      # Dark blue-gray for headers
secondary_blue <- "#3498DB"    # Bright blue for accents
light_blue <- "#ECF0F1"        # Light gray-blue for backgrounds
accent_blue <- "#5DADE2"       # Medium blue for highlights
success_green <- "#27AE60"     # Green for success buttons
danger_red <- "#E74C3C"        # Red for danger buttons
text_dark <- "#2C3E50"         # Dark text
text_light <- "#FFFFFF"        # White text
card_bg <- "#FFFFFF"           # White card backgrounds
border_color <- "#BDC3C7"      # Light gray for borders

# Modern Typography
bold_besar <- tkfont.create(family="Segoe UI", size=28, weight='bold')
title_font <- tkfont.create(family="Segoe UI", size=20, weight='bold')
heading_font <- tkfont.create(family="Segoe UI", size=16, weight='bold')
kecil <- tkfont.create(family="Segoe UI", size=11)
biasa <- tkfont.create(family="Segoe UI", size=13)
bold <- tkfont.create(family="Segoe UI", size=14, weight='bold')
tombol <- tkfont.create(family="Segoe UI", size=11, weight='normal')

label1 <- function(parent, text, font = biasa){
  res <- tklabel(parent, justify = "left", text = text, font = biasa, 
                 bg = card_bg, fg = text_dark, relief = "flat")
  return(res)
}

enter = function(framenya, warna = light_blue){
  tkpack(tklabel(framenya, text="", bg=warna, height=1))
}

label2 <- function(parent, text, font = heading_font){
  res <- tklabel(parent, justify = "center", text = text, font = heading_font, 
                 bg = primary_blue, fg = text_light, relief = "flat", pady = 8)
  return(res)
}

# Modern frame styles with rounded appearance and shadows
topframe <- function(parent){
  res <- tkframe(parent, borderwidth = 2, relief = "solid", bg = card_bg, 
                 highlightbackground = border_color, highlightthickness = 1)
  return(res)
}

midframe <- function(parent){
  res <- tkframe(parent, borderwidth = 2, relief = "solid", bg = light_blue, 
                 highlightbackground = border_color, highlightthickness = 1)
  return(res)
}

bottomframe <- function(parent){
  res <- tkframe(parent, borderwidth = 2, relief = "solid", bg = card_bg, 
                 highlightbackground = accent_blue, highlightthickness = 2)
  return(res)
}

mainmenu <- function(){
  
  tkwm.title(window, "StaDPro AnaLyst - Statistical Analysis Tool")
  tkconfigure(window, bg = light_blue)
  
  # Main container with modern styling
  main_container <- tkframe(window, bg = light_blue, relief = "flat", borderwidth = 0)
  tkpack(main_container, fill = "both", expand = TRUE, padx = 20, pady = 20)
  
  # Header section with gradient-like effect
  header_frame <- tkframe(main_container, relief = "flat", borderwidth = 0, bg = primary_blue, height = 120)
  tkpack(header_frame, fill = "x", pady = c(0, 15))
  
  # Title with modern styling
  tkpack(tklabel(header_frame, text = "StaDPro Analyst", font = bold_besar, 
                 bg = primary_blue, fg = text_light, pady = 15), side = "top", fill = "x")
  tkpack(tklabel(header_frame, text = "Statistical Descriptive and Probability Analysis", 
                 font = title_font, bg = primary_blue, fg = accent_blue), side = "top", fill = "x")
  
  # Team members section with card design
  team_card <- tkframe(main_container, relief = "solid", borderwidth = 1, bg = card_bg, 
                       highlightbackground = border_color, highlightthickness = 1)
  tkpack(team_card, fill = "x", pady = c(0, 15), padx = 10)
  
  # Team header
  team_header <- tkframe(team_card, bg = secondary_blue, height = 40)
  tkpack(team_header, fill = "x")
  tkpack(tklabel(team_header, text = "Tim Pengembang", font = heading_font, 
                 bg = secondary_blue, fg = text_light, pady = 8), side = "top")
  
  # Team members with alternating background
  name <- c("NUR AZIZAH                           \t\t(188221016)", 
            "EZHA EASYFA WIELDYANISA      \t\t(188221080)", 
            "YOGA SETYA WIBAWA            \t\t(188221095)", 
            "RIEZQI DHERMATRIA RACHMADI\t\t(188221100)")
  
  for(i in 1:4){
    member_bg <- if(i %% 2 == 0) light_blue else card_bg
    member_frame <- tkframe(team_card, bg = member_bg, height = 30)
    tkpack(member_frame, fill = "x", padx = 15, pady = 2)
    tkpack(tklabel(member_frame, text = name[i], font = biasa, bg = member_bg, 
                   fg = text_dark, anchor = "w"), side = "left", pady = 5)
  }
  
  # Instructor section with modern card
  instructor_card <- tkframe(main_container, relief = "solid", borderwidth = 1, bg = card_bg,
                            highlightbackground = border_color, highlightthickness = 1)
  tkpack(instructor_card, fill = "x", pady = c(0, 15), padx = 10)
  
  # Instructor header
  inst_header <- tkframe(instructor_card, bg = accent_blue, height = 40)
  tkpack(inst_header, fill = "x")
  tkpack(tklabel(inst_header, text = "Dosen Pengampu", font = heading_font, 
                 bg = accent_blue, fg = text_light, pady = 8), side = "top")
  
  # Instructor names with padding
  inst_content <- tkframe(instructor_card, bg = card_bg)
  tkpack(inst_content, fill = "x", padx = 15, pady = 10)
  tkpack(tklabel(inst_content, text = "Dr. Nur Chamidah S.Si.,M.Si", font = biasa, 
                 bg = card_bg, fg = text_dark), side = "top", pady = 3)
  tkpack(tklabel(inst_content, text = "Dr. Toha Syaifudin S.Si.,M.Si", font = biasa, 
                 bg = card_bg, fg = text_dark), side = "top", pady = 3)
  
  # Action buttons with modern design
  button_frame <- tkframe(main_container, bg = light_blue, height = 60)
  tkpack(button_frame, fill = "x", pady = c(10, 0))
  
  start_btn <- tkbutton(button_frame, relief = "flat", text = "Mulai Aplikasi", font = bold,
                        bg = success_green, fg = text_light, activebackground = "#229954",
                        activeforeground = text_light, borderwidth = 0, pady = 12, padx = 30,
                        command = function() mainmenu1())
  
  stop_btn <- tkbutton(button_frame, relief = "flat", text = "Keluar", font = bold,
                       bg = danger_red, fg = text_light, activebackground = "#C0392B",
                       activeforeground = text_light, borderwidth = 0, pady = 12, padx = 30,
                       command = function() tkdestroy(window))
  
  tkpack(stop_btn, side = "left", padx = c(20, 10), pady = 10)
  tkpack(start_btn, side = "right", padx = c(10, 20), pady = 10)
}

mainmenu()

mainmenu1 <- function(){
  tkdestroy(window)
  
  win <- tktoplevel()
  tkwm.title(win, "StaDPro AnaLyst - Main Dashboard")
  tkconfigure(win, bg = light_blue)
  
  # Create main container
  main_container <- tkframe(win, bg = light_blue, relief = "flat", borderwidth = 0)
  tkpack(main_container, fill = "both", expand = TRUE, padx = 20, pady = 20)
  
  # Menu bar
  topmenu <- tkmenu(win)
  tkconfigure(win, menu = topmenu)
  
  # Input Data Menu
  menu <- tkmenu(topmenu, tearoff = FALSE)
  tkadd(topmenu, "cascade", menu = menu, label = "📊 Input Data")
  tkadd(menu, "command", label = "⌨️ Input Data Manual", command = function() manual())
  tkadd(menu, "command", label = "📁 Import Data (.xlsx .xls .csv)", command = function() import())
  
  # Panduan Menu
  tkadd(topmenu, "command", label = "📖 Panduan", command = function() panduan())
  
  # Materi Menu with modern icons
  menumateri <- tkmenu(topmenu, tearoff = FALSE)
  submenumateriprob <- tkmenu(menumateri, tearoff = FALSE)
  submenumateriprob_diskrit <- tkmenu(submenumateriprob, tearoff = FALSE)
  submenumateriprob_kontinu <- tkmenu(submenumateriprob, tearoff = FALSE)
  
  tkadd(topmenu, "cascade", label = "📚 Materi", menu = menumateri)
  tkadd(menumateri, "command", label = "📈 Statistika Deskriptif", command = function() mtrstat())
  tkadd(menumateri, "cascade", label = "🎲 Probabilitas", menu = submenumateriprob)
  tkadd(submenumateriprob, "cascade", label = "🔢 Probabilitas Diskrit", menu = submenumateriprob_diskrit)
  tkadd(submenumateriprob, "cascade", label = "📊 Probabilitas Kontinu", menu = submenumateriprob_kontinu)
  
  # Discrete probability distributions
  tkadd(submenumateriprob_diskrit, "command", label = "🎯 Distribusi Binomial", command = function() mtrbinom())
  tkadd(submenumateriprob_diskrit, "command", label = "🐟 Distribusi Poisson", command = function() mtrpois())
  tkadd(submenumateriprob_diskrit, "command", label = "🎪 Distribusi Hipergeometrik", command = function() mtrhipergeo())
  tkadd(submenumateriprob_diskrit, "command", label = "🔄 Distribusi Negatif Binomial", command = function() mtrbinomneg())
  tkadd(submenumateriprob_diskrit, "command", label = "📐 Distribusi Geometrik", command = function() mtrgeo())
  
  # Continuous probability distributions
  tkadd(submenumateriprob_kontinu, "command", label = "📈 Distribusi Normal", command = function() mtrnorm())
  tkadd(submenumateriprob_kontinu, "command", label = "χ² Distribusi Chi-Square", command = function() mtrchisq())
  tkadd(submenumateriprob_kontinu, "command", label = "📊 Distribusi T", command = function() mtrt())
  tkadd(submenumateriprob_kontinu, "command", label = "🔀 Distribusi F", command = function() mtrf())
  
  # Welcome header with modern design
  header_frame <- tkframe(main_container, relief = "flat", borderwidth = 0, bg = primary_blue, height = 100)
  tkpack(header_frame, fill = "x", pady = c(0, 20))
  
  tkpack(tklabel(header_frame, text = "Selamat Datang di StaDPro Analyst", font = bold_besar, 
                 bg = primary_blue, fg = text_light, pady = 12), side = "top", fill = "x")
  tkpack(tklabel(header_frame, text = "Analisis Statistik Deskriptif dan Probabilitas", font = title_font, 
                 bg = primary_blue, fg = accent_blue), side = "top", fill = "x")
  
  # Feature cards layout
  cards_container <- tkframe(main_container, bg = light_blue)
  tkpack(cards_container, fill = "both", expand = TRUE, pady = c(0, 20))
  
  # Features card
  feature_card <- tkframe(cards_container, relief = "solid", borderwidth = 1, bg = card_bg,
                         highlightbackground = border_color, highlightthickness = 1)
  tkpack(feature_card, fill = "x", pady = c(0, 15), padx = 10)
  
  # Feature header
  feature_header <- tkframe(feature_card, bg = secondary_blue, height = 45)
  tkpack(feature_header, fill = "x")
  tkpack(tklabel(feature_header, text = "🚀 Fitur Tersedia", font = heading_font, 
                 bg = secondary_blue, fg = text_light, pady = 10), side = "top")
  
  # Feature content
  feature_content <- tkframe(feature_card, bg = card_bg)
  tkpack(feature_content, fill = "x", padx = 20, pady = 15)
  
  feature_list <- tkframe(feature_content, bg = card_bg)
  tkpack(feature_list, side = "left", anchor = "w")
  
  tkpack(tklabel(feature_list, text = "📈 Statistika Deskriptif", font = biasa, 
                 bg = card_bg, fg = text_dark, anchor = "w"), side = "top", anchor = "w", pady = 3)
  tkpack(tklabel(feature_list, text = "🎲 Analisis Probabilitas", font = biasa, 
                 bg = card_bg, fg = text_dark, anchor = "w"), side = "top", anchor = "w", pady = 3)
  tkpack(tklabel(feature_list, text = "📊 Visualisasi Data", font = biasa, 
                 bg = card_bg, fg = text_dark, anchor = "w"), side = "top", anchor = "w", pady = 3)
  
  # Instructions card
  instruction_card <- tkframe(cards_container, relief = "solid", borderwidth = 1, bg = card_bg,
                             highlightbackground = border_color, highlightthickness = 1)
  tkpack(instruction_card, fill = "x", pady = c(0, 20), padx = 10)
  
  # Instruction header
  inst_header <- tkframe(instruction_card, bg = accent_blue, height = 45)
  tkpack(inst_header, fill = "x")
  tkpack(tklabel(inst_header, text = "💡 Panduan Penggunaan", font = heading_font, 
                 bg = accent_blue, fg = text_light, pady = 10), side = "top")
  
  # Instruction content
  inst_content <- tkframe(instruction_card, bg = card_bg)
  tkpack(inst_content, fill = "x", padx = 20, pady = 15)
  
  tkpack(tklabel(inst_content, text = "📖 Buka menu 'Panduan' untuk tutorial lengkap", 
                 font = biasa, bg = card_bg, fg = text_dark, anchor = "w"), side = "top", anchor = "w", pady = 3)
  tkpack(tklabel(inst_content, text = "📊 Input data terlebih dahulu untuk analisis statistik", 
                 font = biasa, bg = card_bg, fg = text_dark, anchor = "w"), side = "top", anchor = "w", pady = 3)
  tkpack(tklabel(inst_content, text = "🎯 Pilih fitur sesuai kebutuhan analisis Anda", 
                 font = biasa, bg = card_bg, fg = text_dark, anchor = "w"), side = "top", anchor = "w", pady = 3)
  
  # Action buttons with modern styling
  button_container <- tkframe(cards_container, bg = light_blue, height = 80)
  tkpack(button_container, fill = "x")
  
  # Create attractive buttons
  stat_btn <- tkbutton(button_container, relief = "flat", text = "📈 Statistika Deskriptif", 
                       font = bold, bg = secondary_blue, fg = text_light,
                       activebackground = "#2980B9", activeforeground = text_light,
                       borderwidth = 0, pady = 15, padx = 25, command = function(){
    if(dataSource == 0) {
      stat_desc(userData)
    } else if (dataSource == 1) {
      stat_desc(importedData)
    }
  })
  
  prob_btn <- tkbutton(button_container, relief = "flat", text = "🎲 Analisis Probabilitas", 
                       font = bold, bg = accent_blue, fg = text_light,
                       activebackground = "#3F8FBF", activeforeground = text_light,
                       borderwidth = 0, pady = 15, padx = 25, command = function() prob())
  
  tkpack(stat_btn, side = "left", padx = c(20, 10), pady = 20)
  tkpack(prob_btn, side = "right", padx = c(10, 20), pady = 20)
  
  panduan <- function() {
    browseURL("https://www.canva.com/design/DAF1htdPOO0/htEyZ-LFvV2GV2Ua45NzsQ/view?utm_content=DAF1htdPOO0&utm_campaign=designshare&utm_medium=link&utm_source=editor")
  }
  
  mtrstat = function(){
    browseURL("https://drive.google.com/file/d/1aJ5_XA9bJN8Ifx1UWp5BWo1sWCoyjYBS/view?usp=drive_link")
  }
  mtrbinom = function(){
    browseURL("https://drive.google.com/file/d/1shQXrFqCI2VeFKfSi0zFgk9ILcLVr-FM/view?usp=drive_link")
  }
  mtrpois = function(){ 
    browseURL("https://drive.google.com/file/d/1ilyRSxuuErWp8lzj05kzs40bHCrnS0jP/view?usp=drive_link")}
  mtrhipergeo = function() { 
    browseURL("https://drive.google.com/file/d/1e6SiEXNLc3Bkrey1-cUQkn7vSpxpUO38/view?usp=drive_link")}
  mtrbinomneg = function(){ 
    browseURL("https://drive.google.com/file/d/1BCiZWVM42aiGvVGyLmDhrYEjEmTgRKse/view?usp=drive_link")}
  mtrgeo = function(){ 
    browseURL("https://drive.google.com/file/d/1klZfUYNFW8GDbwgINy5w_n64wxH1rasJ/view?usp=drive_link")}
  mtrnorm = function(){ 
    browseURL("https://drive.google.com/file/d/1cQPZHBhFztKTI3RmeC5OUJ5seo4UyVw3/view?usp=drive_link")}
  mtrchisq = function (){
    browseURL("https://drive.google.com/file/d/1qCKPmOER7COv2zurDFD6P8hd0WypIuyd/view?usp=drive_link")}
  mtrt = function(){ 
    browseURL("https://drive.google.com/file/d/1QYf1ljMOk0U8n4yoVqH3d_K_yv_9_GKr/view?usp=drive_link")}
  mtrf = function(){ 
    browseURL("https://drive.google.com/file/d/1KD19kZXy8x9Zy9lVyxfSEaMaaLOgxhxH/view?usp=drive_link")}
}

manual <- function(){
  userData <<- data.frame()
  userData <<- edit(userData)
  tryCatch({
    if(nrow(userData) == 0){
      tkmessageBox(title = "📊 Input Data",
                   message = "❌ Tidak ada data yang diinputkan\n\nSilakan input data terlebih dahulu.", 
                   type = "ok", icon = "warning")
    }else{
      tkmessageBox(title = "📊 Input Data", 
                   message = "✅ Data berhasil diinput!\n\nAnda dapat melanjutkan ke analisis statistik.", 
                   type = "ok", icon = "info")
    }
  }, error = function(e){
    tkmessageBox(title = "📊 Input Data", 
                 message = "❌ Tidak ada data yang diinputkan\n\nTerjadi kesalahan saat input data.", 
                 type = "ok", icon = "warning")
  })
  dataSource <<- 0
}

import <- function() {
  filename <<- tkgetOpenFile(filetypes = "{{Excel Files} {.xlsx .xls .csv}}")
  tryCatch({
    dirs <- capture.output(cat(tclvalue(filename)))
    importedData <<- rio::import(dirs)
    tkmessageBox(title = "📁 Import Data", 
                 message = "✅ Data berhasil diimport!\n\nFile telah berhasil dimuat ke dalam sistem.", 
                 type = "ok", icon = "info")
    dataSource <<- 1},
    error = function(e){  
      tkmessageBox(title = "📁 Import Data", 
                   message = "❌ Data belum diimport\n\nSilakan pilih file yang valid (.xlsx, .xls, .csv)", 
                   type = "ok", icon = "warning") 
    })
}

stat_desc <- function(data){
  varContainer <- tktoplevel()
  tktitle(varContainer) <- "StaDPro Analyst - Statistika Deskriptif"
  tkconfigure(varContainer, bg = light_blue)
  
  # Main container
  main_container <- tkframe(varContainer, bg = light_blue, relief = "flat", borderwidth = 0)
  tkpack(main_container, fill = "both", expand = TRUE, padx = 20, pady = 20)
  
  # Header
  header_frame <- tkframe(main_container, relief = "flat", borderwidth = 0, bg = primary_blue, height = 80)
  tkpack(header_frame, fill = "x", pady = c(0, 15))
  tkpack(tklabel(header_frame, text = "📊 Pilih Variabel untuk Analisis", font = heading_font, 
                 bg = primary_blue, fg = text_light, pady = 15), side = "top", fill = "x")
  
  # Variable selection card
  var_card <- tkframe(main_container, relief = "solid", borderwidth = 1, bg = card_bg,
                     highlightbackground = border_color, highlightthickness = 1)
  tkpack(var_card, fill = "both", expand = TRUE, pady = c(0, 15))
  
  # Card header
  card_header <- tkframe(var_card, bg = secondary_blue, height = 40)
  tkpack(card_header, fill = "x")
  tkpack(tklabel(card_header, text = "🔢 Daftar Variabel", font = bold, 
                 bg = secondary_blue, fg = text_light, pady = 8), side = "top")
  
  # List container
  list_container <- tkframe(var_card, bg = card_bg)
  tkpack(list_container, fill = "both", expand = TRUE, padx = 20, pady = 15)
  
  varList <- names(data)
  listbox <- tklistbox(list_container, selectmode = "extended", font = biasa, width = 40, height = 12,
                      bg = card_bg, fg = text_dark, selectbackground = accent_blue,
                      selectforeground = text_light, relief = "solid", borderwidth = 1)
  
  # Add scrollbar
  scrollbar <- tkscrollbar(list_container, orient = "vertical", command = function(...) tkyview(listbox, ...))
  tkconfigure(listbox, yscrollcommand = function(...) tkset(scrollbar, ...))
  
  for(n in varList) {
    tkinsert(listbox, "end", n)
  }
  tkselection.set(listbox, 0)
  
  tkpack(listbox, side = "left", fill = "both", expand = TRUE)
  tkpack(scrollbar, side = "right", fill = "y")
  
  # Button container
  button_container <- tkframe(main_container, bg = light_blue, height = 60)
  tkpack(button_container, fill = "x")
  
  cont_btn <- tkbutton(button_container, relief = "flat", text = "🚀 Lanjutkan Analisis", 
                      font = bold, bg = success_green, fg = text_light,
                      activebackground = "#229954", activeforeground = text_light,
                      borderwidth = 0, pady = 12, padx = 30, command = function() stat())
  
  tkpack(cont_btn, side = "right", padx = 20, pady = 15)
  
  stat <- function(){
    statwin <- tktoplevel()
    tktitle(statwin) <- "StaDPro Analyst - Konfigurasi Analisis"
    tkconfigure(statwin, bg = light_blue)
    
    # Main container
    main_container <- tkframe(statwin, bg = light_blue, relief = "flat", borderwidth = 0)
    tkpack(main_container, fill = "both", expand = TRUE, padx = 20, pady = 20)
    
    # Header
    header_frame <- tkframe(main_container, relief = "flat", borderwidth = 0, bg = primary_blue, height = 80)
    tkpack(header_frame, fill = "x", pady = c(0, 15))
    tkpack(tklabel(header_frame, text = "⚙️ Konfigurasi Analisis Statistik", font = heading_font, 
                   bg = primary_blue, fg = text_light, pady = 15), side = "top", fill = "x")
    
    # Content container
    content_container <- tkframe(main_container, bg = light_blue)
    tkpack(content_container, fill = "both", expand = TRUE)
    
    # Statistics selection card
    stats_card <- tkframe(content_container, relief = "solid", borderwidth = 1, bg = card_bg,
                         highlightbackground = border_color, highlightthickness = 1)
    tkpack(stats_card, fill = "x", pady = c(0, 15))
    
    # Stats header
    stats_header <- tkframe(stats_card, bg = secondary_blue, height = 40)
    tkpack(stats_header, fill = "x")
    tkpack(tklabel(stats_header, text = "📊 Pilih Statistik Deskriptif", font = bold, 
                   bg = secondary_blue, fg = text_light, pady = 8), side = "top")
    
    # Stats content with grid layout
    stats_content <- tkframe(stats_card, bg = card_bg)
    tkpack(stats_content, fill = "x", padx = 20, pady = 15)
    
    # Create checkbox variables
    N_var <- tclVar("0")
    mean_var <- tclVar("0")
    median_var <- tclVar("0")
    sd_var <- tclVar("0")
    var_var <- tclVar("0")
    q1_var <- tclVar("0")
    q3_var <- tclVar("0")
    min_var <- tclVar("0")
    max_var <- tclVar("0")
    SEmean_var <- tclVar("0")
    modus_var <- tclVar("0")
    
    # Create rows for checkboxes
    row1 <- tkframe(stats_content, bg = card_bg)
    row2 <- tkframe(stats_content, bg = card_bg)
    row3 <- tkframe(stats_content, bg = card_bg)
    
    tkpack(row1, fill = "x", pady = 5)
    tkpack(row2, fill = "x", pady = 5)
    tkpack(row3, fill = "x", pady = 5)
    
    # Row 1 checkboxes
    N_frame <- tkframe(row1, bg = card_bg)
    tkpack(N_frame, side = "left", padx = 10)
    tkpack(tkcheckbutton(N_frame, variable = N_var, bg = card_bg, font = biasa), side = "left")
    tkpack(tklabel(N_frame, text = "N (Jumlah Data)", font = biasa, bg = card_bg, fg = text_dark), side = "left", padx = c(5, 0))
    
    mean_frame <- tkframe(row1, bg = card_bg)
    tkpack(mean_frame, side = "left", padx = 10)
    tkpack(tkcheckbutton(mean_frame, variable = mean_var, bg = card_bg, font = biasa), side = "left")
    tkpack(tklabel(mean_frame, text = "Mean (Rata-rata)", font = biasa, bg = card_bg, fg = text_dark), side = "left", padx = c(5, 0))
    
    median_frame <- tkframe(row1, bg = card_bg)
    tkpack(median_frame, side = "left", padx = 10)
    tkpack(tkcheckbutton(median_frame, variable = median_var, bg = card_bg, font = biasa), side = "left")
    tkpack(tklabel(median_frame, text = "Median", font = biasa, bg = card_bg, fg = text_dark), side = "left", padx = c(5, 0))
    
    # Row 2 checkboxes
    sd_frame <- tkframe(row2, bg = card_bg)
    tkpack(sd_frame, side = "left", padx = 10)
    tkpack(tkcheckbutton(sd_frame, variable = sd_var, bg = card_bg, font = biasa), side = "left")
    tkpack(tklabel(sd_frame, text = "Std Deviasi", font = biasa, bg = card_bg, fg = text_dark), side = "left", padx = c(5, 0))
    
    var_frame <- tkframe(row2, bg = card_bg)
    tkpack(var_frame, side = "left", padx = 10)
    tkpack(tkcheckbutton(var_frame, variable = var_var, bg = card_bg, font = biasa), side = "left")
    tkpack(tklabel(var_frame, text = "Varians", font = biasa, bg = card_bg, fg = text_dark), side = "left", padx = c(5, 0))
    
    q1_frame <- tkframe(row2, bg = card_bg)
    tkpack(q1_frame, side = "left", padx = 10)
    tkpack(tkcheckbutton(q1_frame, variable = q1_var, bg = card_bg, font = biasa), side = "left")
    tkpack(tklabel(q1_frame, text = "Q1 (Kuartil 1)", font = biasa, bg = card_bg, fg = text_dark), side = "left", padx = c(5, 0))
    
    # Row 3 checkboxes
    q3_frame <- tkframe(row3, bg = card_bg)
    tkpack(q3_frame, side = "left", padx = 10)
    tkpack(tkcheckbutton(q3_frame, variable = q3_var, bg = card_bg, font = biasa), side = "left")
    tkpack(tklabel(q3_frame, text = "Q3 (Kuartil 3)", font = biasa, bg = card_bg, fg = text_dark), side = "left", padx = c(5, 0))
    
    min_frame <- tkframe(row3, bg = card_bg)
    tkpack(min_frame, side = "left", padx = 10)
    tkpack(tkcheckbutton(min_frame, variable = min_var, bg = card_bg, font = biasa), side = "left")
    tkpack(tklabel(min_frame, text = "Minimum", font = biasa, bg = card_bg, fg = text_dark), side = "left", padx = c(5, 0))
    
    max_frame <- tkframe(row3, bg = card_bg)
    tkpack(max_frame, side = "left", padx = 10)
    tkpack(tkcheckbutton(max_frame, variable = max_var, bg = card_bg, font = biasa), side = "left")
    tkpack(tklabel(max_frame, text = "Maksimum", font = biasa, bg = card_bg, fg = text_dark), side = "left", padx = c(5, 0))
    
    # Plots selection card
    plots_card <- tkframe(content_container, relief = "solid", borderwidth = 1, bg = card_bg,
                         highlightbackground = border_color, highlightthickness = 1)
    tkpack(plots_card, fill = "x", pady = c(0, 15))
    
    # Plots header
    plots_header <- tkframe(plots_card, bg = accent_blue, height = 40)
    tkpack(plots_header, fill = "x")
    tkpack(tklabel(plots_header, text = "📈 Pilih Visualisasi", font = bold, 
                   bg = accent_blue, fg = text_light, pady = 8), side = "top")
    
    # Plots content
    plots_content <- tkframe(plots_card, bg = card_bg)
    tkpack(plots_content, fill = "x", padx = 20, pady = 15)
    
    # Plot variables
    histogram_var <- tclVar("0")
    boxplot_var <- tclVar("0")
    
    # Plot checkboxes
    hist_frame <- tkframe(plots_content, bg = card_bg)
    tkpack(hist_frame, side = "left", padx = 15)
    tkpack(tkcheckbutton(hist_frame, variable = histogram_var, bg = card_bg, font = biasa), side = "left")
    tkpack(tklabel(hist_frame, text = "📊 Histogram", font = biasa, bg = card_bg, fg = text_dark), side = "left", padx = c(5, 0))
    
    box_frame <- tkframe(plots_content, bg = card_bg)
    tkpack(box_frame, side = "left", padx = 15)
    tkpack(tkcheckbutton(box_frame, variable = boxplot_var, bg = card_bg, font = biasa), side = "left")
    tkpack(tklabel(box_frame, text = "📦 Boxplot", font = biasa, bg = card_bg, fg = text_dark), side = "left", padx = c(5, 0))
    
    # Button container
    button_container <- tkframe(main_container, bg = light_blue, height = 60)
    tkpack(button_container, fill = "x")
    
    continue_btn <- tkbutton(button_container, relief = "flat", text = "🚀 Analisis Data", 
                            font = bold, bg = success_green, fg = text_light,
                            activebackground = "#229954", activeforeground = text_light,
                            borderwidth = 0, pady = 12, padx = 30, command = function() result())
    
    tkpack(continue_btn, side = "right", padx = 20, pady = 15)
    
    result <- function(){
      selectedVariable <<- varList[as.numeric(tclvalue(tkcurselection(listbox))) + 1]
      if(dataSource == 0) {
        selectedColumn <<- get(selectedVariable, userData)
      } else if (dataSource == 1) {
        selectedColumn <<- get(selectedVariable, importedData)
      }
      
      
      
      
      selectedStats <- c()
      selectedPlots <- c()
      results <- list()  
      
      if (tclvalue(N_var) == "1") {
        selectedStats <- c(selectedStats, "N")
        results$N <- length(selectedColumn)
      }
      
      if (tclvalue(mean_var) == "1") {
        selectedStats <- c(selectedStats, "Mean")
        results$Mean <- round(mean(selectedColumn),3)
      }
      
      if (tclvalue(median_var) == "1") {
        selectedStats <- c(selectedStats, "Median")
        results$Median <- median(selectedColumn)
      }
      
      if (tclvalue(sd_var)== "1") {
        selectedStats <- c(selectedStats, "StandarDeviasi")
        results$StandarDeviasi <- round(sd(selectedColumn),3)
      }
      
      if (tclvalue(var_var)== "1") {
        selectedStats <- c(selectedStats, "Variance")
        results$Variance <- round(var(selectedColumn),3)
      }
      
      if (tclvalue(q1_var)== "1") {
        selectedStats <- c(selectedStats, "Q1")
        results$Q1 <- quantile(selectedColumn, prob = 0.25)
      }
      
      if (tclvalue(q3_var)== "1") {
        selectedStats <- c(selectedStats, "Q3")
        results$Q3 <- quantile(selectedColumn, prob = 0.75)
      }
      
      if(tclvalue(min_var)== "1") {
        selectedStats <- c(selectedStats, "Minimum")
        results$Minimum <- min(selectedColumn)
      }
      
      if(tclvalue(max_var)== "1") {
        selectedStats <- c(selectedStats, "Maximum")
        results$Maximum <- max(selectedColumn)
      }
      
      if(tclvalue(SEmean_var)== "1") {
        selectedStats <- c(selectedStats, "SEMean")
        results$SEMean <- round(MeanSE(selectedColumn),3)
      }
      
      if (tclvalue(modus_var)== "1") {
        selectedStats <- c(selectedStats, "Modus")
        results$Modus <- Mode(selectedColumn)
      }
      
      if(tclvalue(histogram_var)== "1") {
        selectedPlots <- c(selectedPlots, "Histogram")
      }
      
      if(tclvalue(boxplot_var)== "1") {
        selectedPlots <- c(selectedPlots, "Boxplot")
      }
      
      
      
      hasilstat <- tktoplevel()
      titlecontainer <- topframe(hasilstat)
      container <- midframe(hasilstat)
      buttonContainer <- bottomframe(hasilstat)
      tkwm.title(hasilstat, paste("Hasil - Statistika Deskriptif (", selectedVariable, ")"))
      listbox <- tklistbox(container, selectmode = "extended")
      
      tkgrid(tklabel(titlecontainer, text = paste("Statistik Deskriptif\n", selectedVariable), font = bold, bg = "#93a9d1"), columnspan = 2, pady = c(0, 10), sticky = 'we')
      
      for (i in seq_along(selectedStats)) {
        tkgrid(tklabel(container, text = paste(selectedStats[i], " = ",results[[selectedStats[i]]]), font = biasa, bg = "#61678b"), sticky = 'we')
      }
      if(length(selectedPlots) > 0) {
        windows()
        
        
        for (plotType in selectedPlots) {
          if (plotType == "Histogram") {
            hist(as.numeric(selectedColumn), main = paste("Histogram - ", selectedVariable), xlab = selectedVariable, ylab = "Frequency", col = "blue")
          } else if (plotType == "Boxplot") {
            boxplot(as.numeric(selectedColumn), main = paste("Boxplot - ", selectedVariable), xlab = selectedVariable, ylab = "Frequency", col = "blue")
          }
        }}
      
      
      exit <- tkbutton(buttonContainer, relief = "groove", text = "Back", font = tombol, command = function() tkdestroy(hasilstat))
      tkpack(titlecontainer, fill = "both")
      tkpack(container, fill = "both")
      tkpack(buttonContainer, fill = "both")
      tkpack(exit)
      
    }
  }
  
  
  tkpack(frame1, fill = "both")
  tkpack(listbox,cont_btn, fill = "x", pady = c(0, 10))  
  tkpack(frame2, fill = "both")
  tkpack(frame3, fill = "both")
}




prob <- function(){
  Probwin <- tktoplevel()
  tkwm.title(Probwin, "StaDPro Analyst - Analisis Probabilitas")
  tkconfigure(Probwin, bg = light_blue)
  
  # Main container
  main_container <- tkframe(Probwin, bg = light_blue, relief = "flat", borderwidth = 0)
  tkpack(main_container, fill = "both", expand = TRUE, padx = 20, pady = 20)
  
  # Header
  header_frame <- tkframe(main_container, relief = "flat", borderwidth = 0, bg = primary_blue, height = 100)
  tkpack(header_frame, fill = "x", pady = c(0, 20))
  
  tkpack(tklabel(header_frame, text = "🎲 Analisis Probabilitas", font = bold_besar, 
                 bg = primary_blue, fg = text_light, pady = 15), side = "top", fill = "x")
  tkpack(tklabel(header_frame, text = "Pilih jenis distribusi probabilitas", font = title_font, 
                 bg = primary_blue, fg = accent_blue), side = "top", fill = "x")
  
  # Content container
  content_container <- tkframe(main_container, bg = light_blue)
  tkpack(content_container, fill = "both", expand = TRUE)
  
  # Selection card
  selection_card <- tkframe(content_container, relief = "solid", borderwidth = 1, bg = card_bg,
                           highlightbackground = border_color, highlightthickness = 1)
  tkpack(selection_card, fill = "both", expand = TRUE, pady = c(0, 20))
  
  # Card header
  card_header <- tkframe(selection_card, bg = secondary_blue, height = 50)
  tkpack(card_header, fill = "x")
  tkpack(tklabel(card_header, text = "📊 Jenis Distribusi", font = heading_font, 
                 bg = secondary_blue, fg = text_light, pady = 12), side = "top")
  
  # Button container
  button_container <- tkframe(selection_card, bg = card_bg)
  tkpack(button_container, fill = "both", expand = TRUE, padx = 40, pady = 30)
  
  # Create distribution type buttons with modern styling
  diskrit_btn <- tkbutton(button_container, relief = "flat", text = "🔢 Distribusi Diskrit", 
                         font = title_font, bg = secondary_blue, fg = text_light,
                         activebackground = "#2980B9", activeforeground = text_light,
                         borderwidth = 0, pady = 25, padx = 40, command = function() diskrit())
  
  kontinu_btn <- tkbutton(button_container, relief = "flat", text = "📈 Distribusi Kontinu", 
                         font = title_font, bg = accent_blue, fg = text_light,
                         activebackground = "#3F8FBF", activeforeground = text_light,
                         borderwidth = 0, pady = 25, padx = 40, command = function() kontinu())
  
  # Center the buttons
  tkpack(diskrit_btn, side = "top", pady = c(20, 10), fill = "x")
  tkpack(kontinu_btn, side = "top", pady = c(10, 20), fill = "x")
  
  # Add descriptions
  desc_frame <- tkframe(selection_card, bg = card_bg)
  tkpack(desc_frame, fill = "x", padx = 40, pady = c(0, 20))
  
  tkpack(tklabel(desc_frame, text = "💡 Distribusi Diskrit: untuk data dengan nilai terbatas dan terpisah", 
                 font = biasa, bg = card_bg, fg = text_dark, anchor = "w"), side = "top", anchor = "w", pady = 3)
  tkpack(tklabel(desc_frame, text = "💡 Distribusi Kontinu: untuk data dengan nilai berkelanjutan dalam rentang tertentu", 
                 font = biasa, bg = card_bg, fg = text_dark, anchor = "w"), side = "top", anchor = "w", pady = 3)
  
  diskrit <- function(){
    diskritwin <- tktoplevel()
    tkwm.title(diskritwin, "StaDPro Analyst - Distribusi Diskrit")
    tkconfigure(diskritwin, bg = light_blue)
    
    # Main container
    main_container <- tkframe(diskritwin, bg = light_blue, relief = "flat", borderwidth = 0)
    tkpack(main_container, fill = "both", expand = TRUE, padx = 20, pady = 20)
    
    # Header
    header_frame <- tkframe(main_container, relief = "flat", borderwidth = 0, bg = primary_blue, height = 80)
    tkpack(header_frame, fill = "x", pady = c(0, 20))
    
    tkpack(tklabel(header_frame, text = "🔢 Distribusi Probabilitas Diskrit", font = bold_besar, 
                   bg = primary_blue, fg = text_light, pady = 12), side = "top", fill = "x")
    tkpack(tklabel(header_frame, text = "Pilih jenis distribusi diskrit", font = title_font, 
                   bg = primary_blue, fg = accent_blue), side = "top", fill = "x")
    
    # Content container
    content_container <- tkframe(main_container, bg = light_blue)
    tkpack(content_container, fill = "both", expand = TRUE)
    
    # Distribution buttons card
    dist_card <- tkframe(content_container, relief = "solid", borderwidth = 1, bg = card_bg,
                        highlightbackground = border_color, highlightthickness = 1)
    tkpack(dist_card, fill = "both", expand = TRUE)
    
    # Card header
    card_header <- tkframe(dist_card, bg = secondary_blue, height = 45)
    tkpack(card_header, fill = "x")
    tkpack(tklabel(card_header, text = "📊 Jenis Distribusi Diskrit", font = heading_font, 
                   bg = secondary_blue, fg = text_light, pady = 10), side = "top")
    
    # Buttons container with grid layout
    buttons_container <- tkframe(dist_card, bg = card_bg)
    tkpack(buttons_container, fill = "both", expand = TRUE, padx = 30, pady = 25)
    
    # Create modern distribution buttons
    button_configs = list(
      list(text = "🎯 Binomial", bg = secondary_blue, command = function() binomial()),
      list(text = "📐 Geometrik", bg = accent_blue, command = function() geometric()),
      list(text = "🎪 Hipergeometrik", bg = "#8E44AD", command = function() hypergeometric()),
      list(text = "🐟 Poisson", bg = "#E67E22", command = function() poisson()),
      list(text = "🔄 Negatif Binomial", bg = "#16A085", command = function() negativebinomial())
    )
    
    # Create buttons in rows
    row1 <- tkframe(buttons_container, bg = card_bg)
    row2 <- tkframe(buttons_container, bg = card_bg)
    row3 <- tkframe(buttons_container, bg = card_bg)
    
    tkpack(row1, fill = "x", pady = 8)
    tkpack(row2, fill = "x", pady = 8)
    tkpack(row3, fill = "x", pady = 8)
    
    # Row 1: Binomial and Geometric
    binom_btn <- tkbutton(row1, relief = "flat", text = "🎯 Binomial", 
                         font = bold, bg = secondary_blue, fg = text_light,
                         activebackground = "#2980B9", activeforeground = text_light,
                         borderwidth = 0, pady = 15, padx = 25, command = function() binomial())
    
    geom_btn <- tkbutton(row1, relief = "flat", text = "📐 Geometrik", 
                        font = bold, bg = accent_blue, fg = text_light,
                        activebackground = "#3F8FBF", activeforeground = text_light,
                        borderwidth = 0, pady = 15, padx = 25, command = function() geometric())
    
    tkpack(binom_btn, side = "left", padx = c(0, 10), fill = "x", expand = TRUE)
    tkpack(geom_btn, side = "right", padx = c(10, 0), fill = "x", expand = TRUE)
    
    # Row 2: Hypergeometric and Poisson  
    hyper_btn <- tkbutton(row2, relief = "flat", text = "🎪 Hipergeometrik", 
                         font = bold, bg = "#8E44AD", fg = text_light,
                         activebackground = "#7D3C98", activeforeground = text_light,
                         borderwidth = 0, pady = 15, padx = 25, command = function() hypergeometric())
    
    poiss_btn <- tkbutton(row2, relief = "flat", text = "🐟 Poisson", 
                         font = bold, bg = "#E67E22", fg = text_light,
                         activebackground = "#D35400", activeforeground = text_light,
                         borderwidth = 0, pady = 15, padx = 25, command = function() poisson())
    
    tkpack(hyper_btn, side = "left", padx = c(0, 10), fill = "x", expand = TRUE)
    tkpack(poiss_btn, side = "right", padx = c(10, 0), fill = "x", expand = TRUE)
    
    # Row 3: Negative Binomial (centered)
    bineg_btn <- tkbutton(row3, relief = "flat", text = "🔄 Negatif Binomial", 
                         font = bold, bg = "#16A085", fg = text_light,
                         activebackground = "#138D75", activeforeground = text_light,
                         borderwidth = 0, pady = 15, padx = 25, command = function() negativebinomial())
    
    tkpack(bineg_btn, padx = 50, fill = "x")
    
    binomial <- function(){
      
      
      a = tktoplevel()
      library(tcltk2)
      tktitle(a) = "Distribusi Binomial"
      #nilai x
      x_1 = tclVar(" ")
      eb1 = tkentry(a, width="20", textvariable=x_1)
      tkgrid(tklabel(a, text="Input x :"), eb1, sticky="w")
      #nilai P
      prob = tclVar(" ")
      eb2 = tkentry(a, width="20", textvariable=prob)
      tkgrid(tklabel(a, text="Event probability :"), eb2, sticky="w")
      #banyak n
      perc=tclVar(" ")
      eb3 = tkentry(a, width="20",textvariable=perc)
      tkgrid(tklabel(a,text="Number of trials :"),eb3,sticky="w")
      
      frame=ttkframe(a,padding = c(3,3,12,12))
      tkgrid(frame, sticky = "nsew")
      value = c("Probability density", "Cumulative probabilty")
      var = tclVar(value[1])
      callback = function()print(tclvalue(var))
      sapply(value, function(i){
        radio = ttkradiobutton(frame, variable = var, text = i, value = i, command = callback)
        tkgrid(radio, sticky = "w")
      })
      
      tkgrid(tkbutton(a, text="Input", bg="#93a9d1", command=function() fungsitabel1()))
      
      fungsitabel1 = function()
      {
        n1 = as.numeric(tclvalue(x_1))
        library(tcltk)
        library(tcltk2)
        d = tktoplevel()
        tktitle(d) = "Input nilai x"
        
        tkgrid(tklabel(d ,text="MASUKKAN DATA"))
        
        # input tabel 1
        tclRequire("Tktable")
        bar1 = as.numeric(tclvalue(x_1))
        kol = 1
        wadah1 = matrix(0, bar1, kol)
        x1 = matrix(0, bar1, kol)
        isitabel1 = tclArray()
        
        for (i in 0:bar1)
        {
          for (j in 0:kol)
          {
            isitabel1[[i, j]] = wadah1[i, j]
          }
        }
        
        isitabel1[[0, 0]] = "x"
        
        tabel1 = tkwidget(d, "table", variable=isitabel1, rows=(bar1+1), cols=(kol), titlerows=1, selectmode="extended", colwidth=10, background="#93a9d1")
        tkconfigure(tabel1, selectmode="extended", rowseparator="\"\n\"", colseparator="\"\t\"")
        tkgrid(tabel1, sticky="n")
        
        input1 = function()
        {
          x1 = matrix(0, bar1, kol)
          
          for (i in 1:bar1)
          {
            for (j in 1:kol)
            {
              x1[i, j] = as.numeric(isitabel1[[i, j-1]])
            }
          }
          
          x1 = as.numeric(x1)
          hasil <- function() {
            tkgrid(tklabel(d,text = "Hasil Probabilitas"))
            txt <- tktext(d, width = 50, height = 10)
            tkgrid(txt, padx = 5, pady = 5)
            
            pdf = numeric(length(x1))
            cdf = numeric(length(x1))
            
            for (i in seq_along(x1)){
              # hitung probabilitas x
              pdf[i] = dbinom(x1[i],as.numeric(tclvalue(perc)), as.numeric(tclvalue(prob)),log = FALSE)
              cdf[i] = pbinom(x1[i],as.numeric(tclvalue(perc)), as.numeric(tclvalue(prob)),lower.tail = TRUE, log.p = FALSE)
              if(tclvalue(var) == "Probability density"){
                tkinsert(txt, "1.0", paste("x = ", x1[i], " pdf =", round(pdf[i], 7),"\n")) 
              }
              else {
                tkinsert(txt, "1.0", paste("x = ", x1[i], "cdf =", round(cdf[i], 7), "\n"))
              }
            }
          }
          hasil()
        }
        
        analisis = tkbutton(d, text="Hasil", bg="#93a9d1", command=input1)
        tkgrid(analisis, padx=5, pady=5) 
      }
      
    }
    
    hypergeometric <- function(){
      
      library(tcltk2)
      a = tktoplevel()
      tktitle(a) = "Distribusi Hipergeometrik"
      #nilai x
      x_1 = tclVar(" ")
      eb1 = tkentry(a, width="20", textvariable=x_1)
      tkgrid(tklabel(a, text="Input  x :"), eb1, sticky="w")
      #nilai m
      spop = tclVar(" ")
      eb2 = tkentry(a, width="20", textvariable=spop)
      tkgrid(tklabel(a, text="Population size (N):"), eb2, sticky="w")
      #banyak n
      fpop = tclVar(" ")
      eb3 = tkentry(a, width="20",textvariable=fpop)
      tkgrid(tklabel(a,text="Sample size (n) :"),eb3,sticky="w")
      #nilai k
      tri = tclVar(" ")
      eb4 = tkentry(a, width="20",textvariable=tri)
      tkgrid(tklabel(a,text="Event count in population (M) :"),eb4,sticky="w")
      
      frame=ttkframe(a,padding = c(3,3,12,12))
      tkgrid(frame, sticky = "nsew")
      value = c("Probability density", "Cumulative probabilty")
      var = tclVar(value[1])
      callback = function()print(tclvalue(var))
      sapply(value, function(i){
        radio = ttkradiobutton(frame, variable = var, text = i, value = i, command = callback)
        tkgrid(radio, sticky = "w")
      })
      
      tkgrid(tkbutton(a, text="Input", bg="#93a9d1", command=function() fungsitabel1()))
      
      fungsitabel1 = function()
      {
        n1 = as.numeric(tclvalue(x_1))
        library(tcltk)
        library(tcltk2)
        d = tktoplevel()
        tktitle(d) = "Input nilai x"
        
        tkgrid(tklabel(d, text="MASUKKAN DATA"))
        
        tclRequire("Tktable")
        bar1 = as.numeric(tclvalue(x_1))
        kol = 1
        wadah1 = matrix(0, bar1, kol)
        x1 = matrix(0, bar1, kol)
        isitabel1 = tclArray()
        
        for (i in 0:bar1)
        {
          for (j in 0:kol)
          {
            isitabel1[[i, j]] = wadah1[i, j]
          }
        }
        
        isitabel1[[0, 0]] = "x"
        
        tabel1 = tkwidget(d, "table", variable=isitabel1, rows=(bar1+1), cols=(kol), titlerows=1, selectmode="extended", colwidth=10, background="#93a9d1")
        tkconfigure(tabel1, selectmode="extended", rowseparator="\"\n\"", colseparator="\"\t\"")
        tkgrid(tabel1, sticky="n")
        
        input1 = function()
        {
          x1 = matrix(0, bar1, kol)
          
          for (i in 1:bar1)
          {
            for (j in 1:kol)
            {
              x1[i, j] = as.numeric(isitabel1[[i, j-1]])
            }
          }
          
          x1 = as.numeric(x1)
          hasil <- function() {
            tkgrid(tklabel(d, text="Hasil Probabilitas"))
            txt = tktext(d, width=50, height=10)
            tkgrid(txt, padx=5, pady=5)
            
            pdf <- numeric(length(x1))
            cdf <- numeric(length(x1))
            
            for (i in seq_along(x1)) {
              pdf[i] <- dhyper(x1[i], as.numeric(tclvalue(tri)), as.numeric(tclvalue(spop)) - as.numeric(tclvalue(tri)), as.numeric(tclvalue(fpop)), log = FALSE)
              cdf[i] <- phyper(x1[i], as.numeric(tclvalue(tri)), as.numeric(tclvalue(spop)) - as.numeric(tclvalue(tri)), as.numeric(tclvalue(fpop)), lower.tail = TRUE, log.p = FALSE)
              if(tclvalue(var) == "Probability density"){
                tkinsert(txt, "1.0", paste("x = ", x1[i], " pdf =", round(pdf[i], 7),"\n")) 
              }
              else {
                tkinsert(txt, "1.0", paste("x = ", x1[i], "cdf =", round(cdf[i], 7), "\n"))
              }
            }
          }
          hasil()
        }   
        analisis = tkbutton(d, text="Hasil", bg="#93a9d1", command=input1)
        tkgrid(analisis, padx=5, pady=5) 
      }
      
    }
    
    geometric <- function(){
      
      library(tcltk2)
      a = tktoplevel()
      tktitle(a) = "Distribusi Geometrik"
      
      x_1 = tclVar(" ")
      eb1 = tkentry(a, width="20", textvariable=x_1)
      tkgrid(tklabel(a, text="Input x :"), eb1, sticky="w")
      
      prob = tclVar(" ")
      eb2 = tkentry(a, width="20", textvariable=prob)
      tkgrid(tklabel(a, text="Event Probability :"), eb2, sticky="w")
      
      frame=ttkframe(a,padding = c(3,3,12,12))
      tkgrid(frame, sticky = "nsew")
      value = c("Probability density", "Cumulative probabilty")
      var = tclVar(value[1])
      callback = function()print(tclvalue(var))
      sapply(value, function(i){
        radio = ttkradiobutton(frame, variable = var, text = i, value = i, command = callback)
        tkgrid(radio, sticky = "w")
      })
      
      tkgrid(tkbutton(a, text="Input", bg="#93a9d1", command=function() fungsitabel1()))
      
      fungsitabel1 = function()
      {
        n1 = as.numeric(tclvalue(x_1))
        library(tcltk)
        library(tcltk2)
        d = tktoplevel()
        tktitle(d) = "Input nilai x"
        
        tkgrid(tklabel(d ,text="MASUKKAN DATA"))
        
        # input tabel 1
        tclRequire("Tktable")
        bar1 = as.numeric(tclvalue(x_1))
        kol = 1
        wadah1 = matrix(0, bar1, kol)
        x1 = matrix(0, bar1, kol)
        isitabel1 = tclArray()
        
        for (i in 0:bar1)
        {
          for (j in 0:kol)
          {
            isitabel1[[i, j]] = wadah1[i, j]
          }
        }
        
        isitabel1[[0, 0]] = "x"
        
        tabel1 = tkwidget(d, "table", variable=isitabel1, rows=(bar1+1), cols=(kol), titlerows=1, selectmode="extended", colwidth=10, background="#93a9d1")
        tkconfigure(tabel1, selectmode="extended", rowseparator="\"\n\"", colseparator="\"\t\"")
        tkgrid(tabel1, sticky="n")
        
        input1 = function()
        {
          x1 = matrix(0, bar1, kol)
          
          for (i in 1:bar1)
          {
            for (j in 1:kol)
            {
              x1[i, j] = as.numeric(isitabel1[[i, j-1]])
            }
          }
          
          x1 = as.numeric(x1)
          hasil <- function() {
            tkgrid(tklabel(d,text = "Hasil Probabilitas"))
            txt <- tktext(d, width = 50, height = 10)
            tkgrid(txt, padx = 5, pady = 5)
            
            pdf = numeric(length(x1))
            cdf = numeric(length(x1))
            
            for (i in seq_along(x1)) {
              # hitung probabilitas x
              pdf[i] <- (1 - as.numeric(tclvalue(prob)))^(x1[i] - 1) * as.numeric(tclvalue(prob))
              cdf[i] <- 1 - (1 - as.numeric(tclvalue(prob)))^x1[i]
              if(tclvalue(var) == "Probability density"){
                tkinsert(txt, "1.0", paste("x = ", x1[i], " pdf =", round(pdf[i], 7),"\n")) 
              }
              else {
                tkinsert(txt, "1.0", paste("x = ", x1[i], "cdf =", round(cdf[i], 7), "\n"))
              }
            }
          }
          hasil()
        }
        
        analisis = tkbutton(d, text="Hasil", bg="#93a9d1", command=input1)
        tkgrid(analisis, padx=5, pady=5) 
      }
      
    }
    
    poisson <- function(){
      
      library(tcltk2)
      a = tktoplevel()
      tktitle(a) = "Distribusi Poisson"
      
      x_1 = tclVar(" ")
      eb1 = tkentry(a, width="20", textvariable=x_1)
      tkgrid(tklabel(a, text="Input x :"), eb1, sticky="w")
      
      prob = tclVar(" ")
      eb2 = tkentry(a, width="20", textvariable=prob)
      tkgrid(tklabel(a, text="Mean  λ (lambda) :"), eb2, sticky="w")
      
      
      frame = ttkframe(a, padding = c(3, 3, 12, 12))
      tkgrid(frame, sticky = "nsew")
      value = c("Probability density", "Cumulative probability")
      var = tclVar(value[1])
      callback = function() print(tclvalue(var))
      sapply(value, function(i){
        radio = ttkradiobutton(frame, variable = var, text = i, value = i, command = callback)
        tkgrid(radio, sticky = "w")
      })
      
      tkgrid(tkbutton(a, text="Input", bg="#93a9d1", command=function() fungsitabel_poisson()))
      
      fungsitabel_poisson = function()
      {
        n1 = as.numeric(tclvalue(x_1))
        library(tcltk)
        library(tcltk2)
        d = tktoplevel()
        tktitle(d) = "Input nilai x"
        
        tkgrid(tklabel(d, text="MASUKKAN DATA"))
        
        tclRequire("Tktable")
        bar1 = as.numeric(tclvalue(x_1))
        kol = 1
        wadah1 = matrix(0, bar1, kol)
        x1 = matrix(0, bar1, kol)
        isitabel1 = tclArray()
        
        for (i in 0:bar1)
        {
          for (j in 0:kol)
          {
            isitabel1[[i, j]] = wadah1[i, j]
          }
        }
        
        isitabel1[[0, 0]] = "x"
        
        tabel1 = tkwidget(d, "table", variable=isitabel1, rows=(bar1+1), cols=(kol), titlerows=1, selectmode="extended", colwidth=10, background="#93a9d1")
        tkconfigure(tabel1, selectmode="extended", rowseparator="\"\n\"", colseparator="\"\t\"")
        tkgrid(tabel1, sticky="n")
        
        input1 = function()
        {
          x1 = matrix(0, bar1, kol)
          
          for (i in 1:bar1)
          {
            for (j in 1:kol)
            {
              x1[i, j] = as.numeric(isitabel1[[i, j-1]])
            }
          }
          
          x1 = as.numeric(x1)
          hasil <- function() {
            tkgrid(tklabel(d, text="Hasil Probabilitas"))
            txt = tktext(d, width=50, height=10)
            tkgrid(txt, padx=5, pady=5)
            
            pdf = numeric(length(x1))
            cdf = numeric(length(x1))
            
            for (i in seq_along(x1)){
              pdf[i] = dpois(x1[i], as.numeric(tclvalue(prob)), log=FALSE)
              cdf[i] = ppois(x1[i], as.numeric(tclvalue(prob)), lower.tail=TRUE, log.p=FALSE)
              if (tclvalue(var) == "Probability density"){
                tkinsert(txt, "1.0", paste("x = ", x1[i], " pdf =", round(pdf[i], 7), "\n")) 
              }
              else {
                tkinsert(txt, "1.0", paste("x = ", x1[i], " cdf =", round(cdf[i], 7), "\n"))
              }
            }
          }
          hasil()
        }
        
        analisis = tkbutton(d, text="Hasil", bg="#93a9d1", command=input1)
        tkgrid(analisis, padx=5, pady=5) 
      }
      
    }
    
    negativebinomial <- function(){
      
      library(tcltk2)
      a = tktoplevel()
      tktitle(a) = "Distribusi Binomial Negatif"
      
      x_1 = tclVar(" ")
      eb1 = tkentry(a, width="20", textvariable=x_1)
      tkgrid(tklabel(a, text="Input x :"), eb1, sticky="w")
      
      nr = tclVar(" ")
      eb3 = tkentry(a,width="20",textvariable=nr)
      tkgrid(tklabel(a,text="Number of event needed :"),eb3,sticky="w")
      
      prob = tclVar(" ")
      eb2 = tkentry(a, width="20", textvariable=prob)
      tkgrid(tklabel(a, text= "Event Probability :"), eb2, sticky="w")
      
      frame=ttkframe(a,padding = c(3,3,12,12))
      tkgrid(frame, sticky = "nsew")
      value = c("Probability density", "Cumulative probabilty")
      var = tclVar(value[1])
      callback = function()print(tclvalue(var))
      sapply(value, function(i){
        radio = ttkradiobutton(frame, variable = var, text = i, value = i, command = callback)
        tkgrid(radio, sticky = "w")
      })
      
      tkgrid(tkbutton(a, text="Input", bg="#93a9d1", command=function() fungsitabel1()))
      
      fungsitabel1 = function()
      {
        n1 = as.numeric(tclvalue(x_1))
        library(tcltk)
        library(tcltk2)
        d = tktoplevel()
        tktitle(d) = "Input nilai x"
        
        tkgrid(tklabel(d ,text="MASUKKAN DATA"))
        
        # input tabel 1
        tclRequire("Tktable")
        bar1 = as.numeric(tclvalue(x_1))
        kol = 1
        wadah1 = matrix(0, bar1, kol)
        x1 = matrix(0, bar1, kol)
        isitabel1 = tclArray()
        
        for (i in 0:bar1)
        {
          for (j in 0:kol)
          {
            isitabel1[[i, j]] = wadah1[i, j]
          }
        }
        
        isitabel1[[0, 0]] = "x"
        
        tabel1 = tkwidget(d, "table", variable=isitabel1, rows=(bar1+1), cols=(kol), titlerows=1, selectmode="extended", colwidth=10, background="#93a9d1")
        tkconfigure(tabel1, selectmode="extended", rowseparator="\"\n\"", colseparator="\"\t\"")
        tkgrid(tabel1, sticky="n")
        
        input1 = function()
        {
          x1 = matrix(0, bar1, kol)
          
          for (i in 1:bar1)
          {
            for (j in 1:kol)
            {
              x1[i, j] = as.numeric(isitabel1[[i, j-1]])
            }
          }
          
          x1 = as.numeric(x1)
          hasil <- function() {
            tkgrid(tklabel(d,text = "Hasil Probabilitas"))
            txt <- tktext(d, width = 50, height = 10)
            tkgrid(txt, padx = 5, pady = 5)
            
            pdf = numeric(length(x1))
            cdf = numeric(length(x1))
            
            for (i in seq_along(x1)){
              # hitung probabilitas x
              pdf[i] = choose(x1[i]-1, as.numeric(tclvalue(nr))-1) * (as.numeric(tclvalue(prob))^as.numeric(tclvalue(nr))) * ((1 - as.numeric(tclvalue(prob)))^(x1[i] - as.numeric(tclvalue(nr))))
              cdf[i] = sum(dnbinom(0:(x1[i] - as.numeric(tclvalue(nr))), size = as.numeric(tclvalue(nr)), prob = as.numeric(tclvalue(prob))))
              if(tclvalue(var) == "Probability density"){
                tkinsert(txt, "1.0", paste("x = ", x1[i], " pdf =", round(pdf[i], 7),"\n")) 
              }
              else {
                tkinsert(txt, "1.0", paste("x = ", x1[i], "cdf =", round(cdf[i], 7), "\n"))
              }
            }
          }   
          hasil()
        }
        
        analisis = tkbutton(d, text="Hasil", bg="#93a9d1", command=input1)
        tkgrid(analisis, padx=5, pady=5) 
      }
      
    }
    
  }
  
  kontinu <- function(){
    kontinuwin <- tktoplevel()
    tkwm.title(kontinuwin, "StaDPro Analyst - Distribusi Kontinu")
    tkconfigure(kontinuwin, bg = light_blue)
    
    # Main container
    main_container <- tkframe(kontinuwin, bg = light_blue, relief = "flat", borderwidth = 0)
    tkpack(main_container, fill = "both", expand = TRUE, padx = 20, pady = 20)
    
    # Header
    header_frame <- tkframe(main_container, relief = "flat", borderwidth = 0, bg = primary_blue, height = 80)
    tkpack(header_frame, fill = "x", pady = c(0, 20))
    
    tkpack(tklabel(header_frame, text = "📈 Distribusi Probabilitas Kontinu", font = bold_besar, 
                   bg = primary_blue, fg = text_light, pady = 12), side = "top", fill = "x")
    tkpack(tklabel(header_frame, text = "Pilih jenis distribusi kontinu", font = title_font, 
                   bg = primary_blue, fg = accent_blue), side = "top", fill = "x")
    
    # Content container
    content_container <- tkframe(main_container, bg = light_blue)
    tkpack(content_container, fill = "both", expand = TRUE)
    
    # Distribution buttons card
    dist_card <- tkframe(content_container, relief = "solid", borderwidth = 1, bg = card_bg,
                        highlightbackground = border_color, highlightthickness = 1)
    tkpack(dist_card, fill = "both", expand = TRUE)
    
    # Card header
    card_header <- tkframe(dist_card, bg = secondary_blue, height = 45)
    tkpack(card_header, fill = "x")
    tkpack(tklabel(card_header, text = "📊 Jenis Distribusi Kontinu", font = heading_font, 
                   bg = secondary_blue, fg = text_light, pady = 10), side = "top")
    
    # Buttons container with grid layout
    buttons_container <- tkframe(dist_card, bg = card_bg)
    tkpack(buttons_container, fill = "both", expand = TRUE, padx = 30, pady = 25)
    
    # Create buttons in rows
    row1 <- tkframe(buttons_container, bg = card_bg)
    row2 <- tkframe(buttons_container, bg = card_bg)
    
    tkpack(row1, fill = "x", pady = 12)
    tkpack(row2, fill = "x", pady = 12)
    
    # Row 1: Normal and Chi-Square
    norm_btn <- tkbutton(row1, relief = "flat", text = "📈 Normal", 
                        font = bold, bg = secondary_blue, fg = text_light,
                        activebackground = "#2980B9", activeforeground = text_light,
                        borderwidth = 0, pady = 15, padx = 25, command = function() normal())
    
    chis_btn <- tkbutton(row1, relief = "flat", text = "χ² Chi-Square", 
                        font = bold, bg = accent_blue, fg = text_light,
                        activebackground = "#3F8FBF", activeforeground = text_light,
                        borderwidth = 0, pady = 15, padx = 25, command = function() chisquare())
    
    tkpack(norm_btn, side = "left", padx = c(0, 10), fill = "x", expand = TRUE)
    tkpack(chis_btn, side = "right", padx = c(10, 0), fill = "x", expand = TRUE)
    
    # Row 2: T and F distributions
    T_btn <- tkbutton(row2, relief = "flat", text = "📊 T (Student)", 
                     font = bold, bg = "#8E44AD", fg = text_light,
                     activebackground = "#7D3C98", activeforeground = text_light,
                     borderwidth = 0, pady = 15, padx = 25, command = function() disT())
    
    F_btn <- tkbutton(row2, relief = "flat", text = "🔀 F (Fisher)", 
                     font = bold, bg = "#E67E22", fg = text_light,
                     activebackground = "#D35400", activeforeground = text_light,
                     borderwidth = 0, pady = 15, padx = 25, command = function() disF())
    
    tkpack(T_btn, side = "left", padx = c(0, 10), fill = "x", expand = TRUE)
    tkpack(F_btn, side = "right", padx = c(10, 0), fill = "x", expand = TRUE)
    
    
    normal <- function(){
      library(tcltk2)
      a = tktoplevel()
      tktitle(a) = "Distribusi Normal"
      
      x_1 = tclVar(" ")
      eb1 = tkentry(a, width="20", textvariable=x_1)
      tkgrid(tklabel(a, text="Input x :"), eb1, sticky="w")
      
      mean = tclVar(" ")
      eb2 = tkentry(a, width="20", textvariable=mean)
      tkgrid(tklabel(a, text="Mean :"), eb2, sticky="w")
      
      sd = tclVar(" ")
      eb3 = tkentry(a, width="20", textvariable=sd)
      tkgrid(tklabel(a, text="Standar deviation :"), eb3, sticky="w")
      
      frame=ttkframe(a,padding = c(3,3,12,12))
      tkgrid(frame, sticky = "nsew")
      value = c("Probability density", "Cumulative probabilty")
      var = tclVar(value[1])
      callback = function()print(tclvalue(var))
      sapply(value, function(i){
        radio = ttkradiobutton(frame, variable = var, text = i, value = i, command = callback)
        tkgrid(radio, sticky = "w")
      })
      
      tkgrid(tkbutton(a, text="Input", bg="#93a9d1", command=function() fungsitabel1()))
      
      fungsitabel1 = function()
      {
        n1 = as.numeric(tclvalue(x_1))
        library(tcltk)
        library(tcltk2)
        d = tktoplevel()
        tktitle(d) = "Input nilai x"
        
        tkgrid(tklabel(d ,text="MASUKKAN DATA"))
        
        # input tabel 1
        tclRequire("Tktable")
        bar1 = as.numeric(tclvalue(x_1))
        kol = 1
        wadah1 = matrix(0, bar1, kol)
        x1 = matrix(0, bar1, kol)
        isitabel1 = tclArray()
        
        for (i in 0:bar1)
        {
          for (j in 0:kol)
          {
            isitabel1[[i, j]] = wadah1[i, j]
          }
        }
        
        isitabel1[[0, 0]] = "x"
        
        tabel1 = tkwidget(d, "table", variable=isitabel1, rows=(bar1+1), cols=(kol), titlerows=1, selectmode="extended", colwidth=10, background="#93a9d1")
        tkconfigure(tabel1, selectmode="extended", rowseparator="\"\n\"", colseparator="\"\t\"")
        tkgrid(tabel1, sticky="n")
        
        input1 = function()
        {
          x1 = matrix(0, bar1, kol)
          
          for (i in 1:bar1)
          {
            for (j in 1:kol)
            {
              x1[i, j] = as.numeric(isitabel1[[i, j-1]])
            }
          }
          
          x1 = as.numeric(x1)
          hasil <- function() {
            tkgrid(tklabel(d,text = "Hasil Probabilitas"))
            txt <- tktext(d, width = 50, height = 10)
            tkgrid(txt, padx = 5, pady = 5)
            
            pdf = numeric(length(x1))
            cdf = numeric(length(x1))
            
            for (i in seq_along(x1)){
              # hitung probabilitas x
              pdf[i] = dnorm(x1[i], as.numeric(tclvalue(mean)), as.numeric(tclvalue(sd)))
              cdf[i] = pnorm(x1[i], as.numeric(tclvalue(mean)), as.numeric(tclvalue(sd)))
              if(tclvalue(var) == "Probability density"){
                tkinsert(txt, "1.0", paste("x = ", x1[i], " pdf =", round(pdf[i], 7),"\n")) 
              }
              else {
                tkinsert(txt, "1.0", paste("x = ", x1[i], "cdf =", round(cdf[i], 7), "\n"))
              }
            }
          }
          hasil()
        }
        
        analisis = tkbutton(d, text="Hasil", bg="#93a9d1", command=input1)
        tkgrid(analisis, padx=5, pady=5) 
      }
    }
    
    disT <- function(){
      library(tcltk2)
      a = tktoplevel()
      tktitle(a) = "Distribusi T"
      
      x_1 = tclVar(" ")
      eb1 = tkentry(a, width="20", textvariable=x_1)
      tkgrid(tklabel(a, text="Input x :"), eb1, sticky="w")
      
      df = tclVar(" ")
      eb2 = tkentry(a, width="20", textvariable=df)
      tkgrid(tklabel(a, text="Degrees of freedom :"), eb2, sticky="w")
      
      
      frame=ttkframe(a,padding = c(3,3,12,12))
      tkgrid(frame, sticky = "nsew")
      value = c("Probability density", "Cumulative probabilty")
      var = tclVar(value[1])
      callback = function()print(tclvalue(var))
      sapply(value, function(i){
        radio = ttkradiobutton(frame, variable = var, text = i, value = i, command = callback)
        tkgrid(radio, sticky = "w")
      })
      
      tkgrid(tkbutton(a, text="Input", bg="#93a9d1", command=function() fungsitabel1()))
      
      fungsitabel1 = function()
      {
        n1 = as.numeric(tclvalue(x_1))
        library(tcltk)
        library(tcltk2)
        d = tktoplevel()
        tktitle(d) = "Input nilai x"
        
        tkgrid(tklabel(d ,text="MASUKKAN DATA"))
        
        # input tabel 1
        tclRequire("Tktable")
        bar1 = as.numeric(tclvalue(x_1))
        kol = 1
        wadah1 = matrix(0, bar1, kol)
        x1 = matrix(0, bar1, kol)
        isitabel1 = tclArray()
        
        for (i in 0:bar1)
        {
          for (j in 0:kol)
          {
            isitabel1[[i, j]] = wadah1[i, j]
          }
        }
        
        isitabel1[[0, 0]] = "x"
        
        tabel1 = tkwidget(d, "table", variable=isitabel1, rows=(bar1+1), cols=(kol), titlerows=1, selectmode="extended", colwidth=10, background="#93a9d1")
        tkconfigure(tabel1, selectmode="extended", rowseparator="\"\n\"", colseparator="\"\t\"")
        tkgrid(tabel1, sticky="n")
        
        input1 = function()
        {
          x1 = matrix(0, bar1, kol)
          
          for (i in 1:bar1)
          {
            for (j in 1:kol)
            {
              x1[i, j] = as.numeric(isitabel1[[i, j-1]])
            }
          }
          
          x1 = as.numeric(x1)
          hasil <- function() {
            tkgrid(tklabel(d,text = "Hasil Probabilitas"))
            txt <- tktext(d, width = 50, height = 10)
            tkgrid(txt, padx = 5, pady = 5)
            
            pdf = numeric(length(x1))
            cdf = numeric(length(x1))
            
            for (i in seq_along(x1)){
              # hitung probabilitas x
              pdf[i] = dt(x1[i], as.numeric(tclvalue(df)))
              cdf[i] = pt(x1[i], as.numeric(tclvalue(df)))
              if(tclvalue(var) == "Probability density"){
                tkinsert(txt, "1.0", paste("x = ", x1[i], " pdf =", round(pdf[i], 7),"\n")) 
              }
              else {
                tkinsert(txt, "1.0", paste("x = ", x1[i], "cdf =", round(cdf[i], 7), "\n"))
              }
            }
          }
          hasil()
        }
        
        analisis = tkbutton(d, text="Hasil", bg="#93a9d1", command=input1)
        tkgrid(analisis, padx=5, pady=5) 
      }
    }
    
    disF <- function(){
      library(tcltk2)
      a = tktoplevel()
      tktitle(a) = "Distribusi F"
      
      x_1 = tclVar(" ")
      eb1 = tkentry(a, width="20", textvariable=x_1)
      tkgrid(tklabel(a, text="Input x :"), eb1, sticky="w")
      
      df1 = tclVar(" ")
      eb2 = tkentry(a, width="20", textvariable=df1)
      tkgrid(tklabel(a, text="Numerator degrees of freedom :"), eb2, sticky="w")
      
      df2 = tclVar(" ")
      eb3 = tkentry(a, width="20", textvariable=df2)
      tkgrid(tklabel(a, text="Denominator degrees of freedom :"), eb3, sticky="w")
      
      frame=ttkframe(a,padding = c(3,3,12,12))
      tkgrid(frame, sticky = "nsew")
      value = c("Probability density", "Cumulative probabilty")
      var = tclVar(value[1])
      callback = function()print(tclvalue(var))
      sapply(value, function(i){
        radio = ttkradiobutton(frame, variable = var, text = i, value = i, command = callback)
        tkgrid(radio, sticky = "w")
      })
      
      tkgrid(tkbutton(a, text="Input", bg="#93a9d1", command=function() fungsitabel1()))
      
      fungsitabel1 = function()
      {
        n1 = as.numeric(tclvalue(x_1))
        library(tcltk)
        library(tcltk2)
        d = tktoplevel()
        tktitle(d) = "Input nilai x"
        
        tkgrid(tklabel(d ,text="MASUKKAN DATA"))
        
        # input tabel 1
        tclRequire("Tktable")
        bar1 = as.numeric(tclvalue(x_1))
        kol = 1
        wadah1 = matrix(0, bar1, kol)
        x1 = matrix(0, bar1, kol)
        isitabel1 = tclArray()
        
        for (i in 0:bar1)
        {
          for (j in 0:kol)
          {
            isitabel1[[i, j]] = wadah1[i, j]
          }
        }
        
        isitabel1[[0, 0]] = "x"
        
        tabel1 = tkwidget(d, "table", variable=isitabel1, rows=(bar1+1), cols=(kol), titlerows=1, selectmode="extended", colwidth=10, background="#93a9d1")
        tkconfigure(tabel1, selectmode="extended", rowseparator="\"\n\"", colseparator="\"\t\"")
        tkgrid(tabel1, sticky="n")
        
        input1 = function()
        {
          x1 = matrix(0, bar1, kol)
          
          for (i in 1:bar1)
          {
            for (j in 1:kol)
            {
              x1[i, j] = as.numeric(isitabel1[[i, j-1]])
            }
          }
          
          x1 = as.numeric(x1)
          hasil <- function() {
            tkgrid(tklabel(d,text = "Hasil Probabilitas"))
            txt <- tktext(d, width = 50, height = 10)
            tkgrid(txt, padx = 5, pady = 5)
            
            pdf = numeric(length(x1))
            cdf = numeric(length(x1))
            
            for (i in seq_along(x1)){
              # hitung probabilitas x
              pdf[i] = df(x1[i], as.numeric(tclvalue(df1)), as.numeric(tclvalue(df2)))
              cdf[i] = pf(x1[i], as.numeric(tclvalue(df1)), as.numeric(tclvalue(df2)))
              if(tclvalue(var) == "Probability density"){
                tkinsert(txt, "1.0", paste("x = ", x1[i], " pdf =", round(pdf[i], 7),"\n")) 
              }
              else {
                tkinsert(txt, "1.0", paste("x = ", x1[i], "cdf =", round(cdf[i], 7), "\n"))
              }
            }
          }
          hasil()
        }
        
        analisis = tkbutton(d, text="Hasil", bg="#93a9d1", command=input1)
        tkgrid(analisis, padx=5, pady=5) 
      }
    } 
    
    chisquare <- function(){
      library(tcltk2)
      a = tktoplevel()
      tktitle(a) = "Distribusi Chi-Square"
      
      x_1 = tclVar(" ")
      eb1 = tkentry(a, width="20", textvariable=x_1)
      tkgrid(tklabel(a, text="Input x :"), eb1, sticky="w")
      
      df = tclVar(" ")
      eb2 = tkentry(a, width="20", textvariable=df)
      tkgrid(tklabel(a, text="Degrees of freedom :"), eb2, sticky="w")
      
      frame=ttkframe(a,padding = c(3,3,12,12))
      tkgrid(frame, sticky = "nsew")
      value = c("Probability density", "Cumulative probabilty")
      var = tclVar(value[1])
      callback = function()print(tclvalue(var))
      sapply(value, function(i){
        radio = ttkradiobutton(frame, variable = var, text = i, value = i, command = callback)
        tkgrid(radio, sticky = "w")
      })
      
      tkgrid(tkbutton(a, text="Input", bg="#93a9d1", command=function() fungsitabel1()))
      
      fungsitabel1 = function()
      {
        n1 = as.numeric(tclvalue(x_1))
        library(tcltk)
        library(tcltk2)
        d = tktoplevel()
        tktitle(d) = "Input nilai x"
        
        tkgrid(tklabel(d ,text="MASUKKAN DATA"))
        
        # input tabel 1
        tclRequire("Tktable")
        bar1 = as.numeric(tclvalue(x_1))
        kol = 1
        wadah1 = matrix(0, bar1, kol)
        x1 = matrix(0, bar1, kol)
        isitabel1 = tclArray()
        
        for (i in 0:bar1)
        {
          for (j in 0:kol)
          {
            isitabel1[[i, j]] = wadah1[i, j]
          }
        }
        
        isitabel1[[0, 0]] = "x"
        
        tabel1 = tkwidget(d, "table", variable=isitabel1, rows=(bar1+1), cols=(kol), titlerows=1, selectmode="extended", colwidth=10, background="#93a9d1")
        tkconfigure(tabel1, selectmode="extended", rowseparator="\"\n\"", colseparator="\"\t\"")
        tkgrid(tabel1, sticky="n")
        
        input1 = function()
        {
          x1 = matrix(0, bar1, kol)
          
          for (i in 1:bar1)
          {
            for (j in 1:kol)
            {
              x1[i, j] = as.numeric(isitabel1[[i, j-1]])
            }
          }
          
          x1 = as.numeric(x1)
          hasil <- function() {
            tkgrid(tklabel(d,text = "Hasil Probabilitas"))
            txt <- tktext(d, width = 50, height = 10)
            tkgrid(txt, padx = 5, pady = 5)
            
            pdf = numeric(length(x1))
            cdf = numeric(length(x1))
            
            for (i in seq_along(x1)){
              # hitung probabilitas x
              pdf[i] = dchisq(x1[i], as.numeric(tclvalue(df)))
              cdf[i] = pchisq(x1[i], as.numeric(tclvalue(df)))
              if(tclvalue(var) == "Probability density"){
                tkinsert(txt, "1.0", paste("x = ", x1[i], " pdf =", round(pdf[i], 7),"\n")) 
              }
              else {
                tkinsert(txt, "1.0", paste("x = ", x1[i], "cdf =", round(cdf[i], 7), "\n"))
              }
            }
          }
          hasil()
        }
        
        analisis = tkbutton(d, text="Hasil", bg="#93a9d1", command=input1)
        tkgrid(analisis, padx=5, pady=5) 
      }
    }
    
    
    
    
  }
  
  
  
  
  
}

