
spd_plot <- norm_summary_spd |> 
  filter(year == 2019) |> 
  mutate(day_type = str_to_sentence(day_type)) |> 
  ggplot(aes(x = hour,y = d_norm_speed))+
  # geom_boxplot(aes(group = HORA), fill = NA,alpha = 0.3,outlier.shape = NA)+
  # geom_jitter(alpha = 0.3, size = 0.3,col = "gray60")+
  stat_summary(geom = "line",
               fun = "mean",
               aes(col = day_type,
                   group = TID),
               linewidth = 0.08,
               alpha = 0.07,
               # show.legend = F
  )+
  facet_grid(day_type~.)+
  theme_minimal()+
  stat_summary(geom = "line",
               fun = "mean",
               aes(col = day_type),
               linewidth = 1.5,
               alpha = 1,linetype="dashed"
               # show.legend = F
  )+
  labs(title = "Daily speed profile",
       subtitle = "Observed speed vs 94th percentile",
    x = "Hour",
    y = "Ratio")+
  scale_x_continuous(breaks = 0:23,
                     labels = sprintf("%02d:00",0:23))+
  scale_y_continuous(limits = c(0,1.25),breaks = seq(0,1.25,0.25))+
  scale_colour_manual(values = paletteer_d("ggsci::default_nejm",n = 3))+
  theme(text = element_text(family = "Roboto Light"),
        axis.text.x = element_text(angle = 90),
        panel.grid.minor = element_blank(),
        legend.position = "none")


ggsave(plot = spd_plot,filename = "speed_plot.png",dpi = 320,units = "mm",height = 230,width = 170)
