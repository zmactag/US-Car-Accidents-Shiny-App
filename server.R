#server.R Sample


function(input, output) {
  
  
  #Input for Accidents by Day Histogram------------------------------------------------------------------------
  severity_filter = reactive({
    df = accidents_sample_small
    
    if (input$Severity_Input_Day != 'All'){
      df = df %>% filter(Severity == as.numeric(input$Severity_Input_Day))
    }
    
    if (input$Hour_Input_Day != 'All'){
      df = df %>% filter(as.character(Hour) == input$Hour_Input_Day)
    }
    
    if (input$Time_Input_Day != 'All'){
      df = df %>% filter(as.character(Sunrise_Sunset) == input$Time_Input_Day)
    }
    
    if (input$State_Input_Day != 'All'){
      df = df %>% filter(as.character(State) == input$State_Input_Day)
    }
    
    if (input$Year_Input_Day != 'All'){
      df = df %>% filter(Year == as.numeric(input$Year_Input_Day))
    }
    
    if (input$Weather_Input_Day != 'All'){
      df = df %>% filter(as.character(Weather) == input$Weather_Input_Day)
    }
    
    return(df)
    
  })
  
  output$histogram_day = renderPlot({
    
    filtered_data = severity_filter()
    
    filtered_data = as.data.frame(filtered_data)
    
    ggplot(data = filtered_data, aes(x = Day, fill = Day)) + 
      geom_bar(color = 'black') +
      labs(title = 'Accidents by Day of the Week', x = 'Day of the Week', y = 'Accident Frequency') + 
      scale_y_continuous(labels = scales::number_format(scale = 1)) +
      scale_fill_manual(values = c('#3333cc', '#9898e6', '#9898e6', '#9898e6', '#9898e6', '#9898e6', '#3333cc')) +
      theme(plot.title = element_text(size = 16, face = 'bold'),
            axis.title.x = element_text(size = 14),
            axis.title.y = element_text(size = 14)
      )
    
    
    
  })
  
  
  #Inputs for Accidents by Month Histogram-------------------------------------------------------------------------
  severity_filter_month = reactive({
    df = accidents_sample_small
    
    if (input$Severity_Input_Month != 'All'){
      df = df %>% filter(Severity == as.numeric(input$Severity_Input_Month))
    }
    
    if (input$Hour_Input_Month != 'All'){
      df = df %>% filter(as.character(Hour) == input$Hour_Input_Month)
    }
    
    if (input$Time_Input_Month != 'All'){
      df = df %>% filter(as.character(Sunrise_Sunset) == input$Time_Input_Month)
    }
    
    if (input$State_Input_Month != 'All'){
      df = df %>% filter(as.character(State) == input$State_Input_Month)
    }
    
    if (input$Year_Input_Month != 'All'){
      df = df %>% filter(Year == as.numeric(input$Year_Input_Month))
    }
    
    if (input$Weather_Input_Month != 'All'){
      df = df %>% filter(as.character(Weather) == input$Weather_Input_Month)
    }
    
    return(df)
    
  })
  
  output$histogram_month = renderPlot({
    
    filtered_data_month = severity_filter_month()
    
    filtered_data_month = as.data.frame(filtered_data_month)
    
    ggplot(data = filtered_data_month, aes(x = Month, fill = Month)) + 
      geom_bar(color = 'black') +
      labs(title = 'Accidents by Month', x = 'Month', y = 'Accident Frequency') + 
      scale_y_continuous(labels = scales::number_format(scale = 1)) +
      scale_fill_manual(values = c('01' = '#99d6ff', '02' = '#99d6ff', '03' = '#c1f0c1', '04' = '#c1f0c1','05' = '#c1f0c1',
                                   '06' = '#ffb3b3', '07' = '#ffb3b3', '08' = '#ffb3b3', '09' = '#ffd1b3','10' = '#ffd1b3',
                                   '11' = '#ffd1b3', '12' = '#99d6ff' )) +
      theme(plot.title = element_text(size = 16, face = 'bold'),
            axis.title.x = element_text(size = 12),
            axis.title.y = element_text(size = 12)
      )
    
  })
  
  
  #Inputs for Accidents by Year Histogram------------------------------------------------------------------------
  severity_filter_year = reactive({
    df = accidents_sample_small
    
    if (input$Severity_Input_Year != 'All'){
      df = df %>% filter(Severity == as.numeric(input$Severity_Input_Year))
    }
    
    if (input$Hour_Input_Year != 'All'){
      df = df %>% filter(as.character(Hour) == input$Hour_Input_Year)
    }
    
    if (input$Time_Input_Year != 'All'){
      df = df %>% filter(as.character(Sunrise_Sunset) == input$Time_Input_Year)
    }
    
    if (input$State_Input_Year != 'All'){
      df = df %>% filter(as.character(State) == input$State_Input_Year)
    }
    
    if (input$Weather_Input_Year != 'All'){
      df = df %>% filter(as.character(Weather) == input$Weather_Input_Year)
    }
    
    return(df)
    
  })
  
  output$histogram_year = renderPlot({
    
    filtered_data_year = severity_filter_year()
    
    filtered_data_year = as.data.frame(filtered_data_year)
    
    ggplot(data = filtered_data_year, aes(x = Year, fill = Year)) + 
      geom_bar(color = 'black', fill = '#000080') +
      #scale_fill_manual(values = c('#ed254e', '#06bcc1','#12263a'))+
      labs(title = 'Accidents by Year', x = 'Year', y = 'Accident Frequency') + 
      scale_y_continuous(labels = scales::number_format(scale = 1)) +
      theme(plot.title = element_text(size = 16, face = 'bold'),
            axis.title.x = element_text(size = 12),
            axis.title.y = element_text(size = 12))
    
  })
  
  #Leaflet 1 Inputs--------------------------------------------------------------------------------------
  output$map = renderLeaflet({
    
    
    leaflet(data = accidents_sample_small) %>% 
      
      addTiles() %>% 
      
      addProviderTiles(provider = 'CartoDB.Positron') %>%  #providers$Esri.NatGeoWorldMap
      
      addCircleMarkers(clusterOptions = markerClusterOptions(),
                       lng = ~Start_Lng, 
                       lat = ~Start_Lat, 
                       color = ~pal_test(Severity), 
                       label = ~Description, stroke = FALSE, 
                       fillOpacity = 0.8,
                       radius =  6) %>%  # old way : ~sqrt(Severity)
      addLegend('bottomright',
                colors = c("#87CEEB", "#6495ED", "#4169E1", "#000080"),
                labels = c('1', '2', '3', '4'),
                title = "Accident Severity",opacity = 1)
    
    
  })
  
  
  #Leaflet 2 --- Filtered Leaflet Inputs----------------------------------------------------------------
  severity_filter_leaflet = reactive({
    df = accidents_sample_small
    
    if (input$Severity_Input_Leaflet != 'All'){
      df = df %>% filter(Severity == as.numeric(input$Severity_Input_Leaflet))
    }
    
    if (input$Hour_Input_Leaflet != 'All'){
      df = df %>% filter(as.character(Hour) == input$Hour_Input_Leaflet)
    }
    
    if (input$Time_Input_Leaflet != 'All'){
      df = df %>% filter(as.character(Sunrise_Sunset) == input$Time_Input_Leaflet)
    }
    
    if (input$State_Input_Leaflet != 'All'){
      df = df %>% filter(as.character(State) == input$State_Input_Leaflet)
    }
    
    if (input$Year_Input_Leaflet != 'All'){
      df = df %>% filter(Year == as.numeric(input$Year_Input_Leaflet))
    }
    
    if (input$Weather_Input_Leaflet != 'All'){
      df = df %>% filter(as.character(Weather) == input$Weather_Input_Leaflet)
    }
    
    return(df)
    
  })
  
  
  
  output$map_2 = renderLeaflet({
    
    leaflet(data = severity_filter_leaflet()) %>% 
      
      addTiles() %>% 
      
      addProviderTiles(provider = 'CartoDB.Positron') %>%
      
      addCircleMarkers(clusterOptions = markerClusterOptions(),
                       lng = ~Start_Lng, 
                       lat = ~Start_Lat, 
                       color = ~pal_test(Severity), 
                       label = ~Description, stroke = FALSE, 
                       fillOpacity = 0.5,
                       radius =  6) %>% 
      addLegend('bottomright',
                colors = c("#87CEEB", "#6495ED", "#4169E1", "#000080"),
                labels = c('1', '2', '3', '4'),
                title = "Accident Severity",opacity = 1)
    
    
  })
  
  #Traffic Control Features Inputs-----------------------------------------------------------------
  
  traffic_control_filter = reactive({
    df = accidents_sample_small
    
    if (input$Severity_Input_Traffic != 'All'){
      df = df %>% filter(Severity == as.numeric(input$Severity_Input_Traffic))
    }
    
    if (input$Hour_Input_Traffic != 'All'){
      df = df %>% filter(as.character(Hour) == input$Hour_Input_Traffic)
    }
    
    if (input$Time_Input_Traffic != 'All'){
      df = df %>% filter(as.character(Sunrise_Sunset) == input$Time_Input_Traffic)
    }
    
    if (input$State_Input_Traffic != 'All'){
      df = df %>% filter(as.character(State) == input$State_Input_Traffic)
    }
    
    if (input$Year_Input_Traffic != 'All'){
      df = df %>% filter(Year == as.numeric(input$Year_Input_Traffic))
    }
    
    if (input$Weather_Input_Traffic != 'All'){
      df = df %>% filter(as.character(Weather) == input$Weather_Input_Traffic)
    }
    
    return(df)
    
  })
  
  output$traffic_graph = renderPlot({
    
    filtered_df_traffic = traffic_control_filter()
    
    binary_counts = filtered_df_traffic %>% 
      summarize(
        Crossings = sum(Crossing),
        Junctions = sum(Junction),
        Stops = sum(Stop),
        Traffic_Signal_Count = sum(Traffic_Signal)
      )
    
    
    binary_counts = gather(binary_counts, Binary, Count)
    
    ggplot(binary_counts, aes(x = Binary, y = Count, fill = Binary)) +
      geom_bar(color = 'black', stat = "identity") +
      labs(title = 'Accident Frequency Near Top 4 Traffic Control Features', x = "Traffic Control Feature", y = "Frequency") +
      scale_fill_manual(values = c('#2a3d45', '#62bbc1', '#ab3428', '#f49e4c'), name = 'Traffic Feature') +
      scale_y_continuous(labels = scales::number_format(scale = 1)) +
      scale_x_discrete(labels = c('Traffic_Signal_Count' = 'Traffic Signals'))+
      theme(plot.title = element_text(size = 16, face = 'bold'),
            axis.title.x = element_text(size = 12),
            axis.title.y = element_text(size = 12))
    
  })
  
  # Accidents by Population Inputs-----------------------------------------------------------------
  
  accidents_filt_pop = reactive({
    data = accidents_pop_totals %>% 
      select(State, input$pop_col)
    
    if (input$top_bot == 'Top 5'){
      data = data %>% 
        arrange(desc(.data[[input$pop_col]])) %>% 
        slice_head(n = 5)
    } else if (input$top_bot == 'Bottom 5') {
      data = data %>% 
        arrange(.data[[input$pop_col]]) %>% 
        slice_head(n = 5)
    }
    return(data)
    
  })
  
  
  output$population_graph = renderPlot({
    ggplot(accidents_filt_pop(), aes(x = reorder(State, .data[[input$pop_col]]), y = .data[[input$pop_col]])) + 
      geom_bar(color = 'black', stat = 'identity', fill = '#000080') + 
      labs(title = "Accidents Per 100,000 People", x = "State", y = "Frequency")+
      theme(plot.title = element_text(size = 16, face = 'bold'),
            axis.title.x = element_text(size = 12),
            axis.title.y = element_text(size = 12))
    
    
    
  })
  
}

