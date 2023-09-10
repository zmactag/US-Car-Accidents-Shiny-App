#ui.R Sample


dashboardPage(skin = 'black',
              
              ## Dashboard Title ##
              dashboardHeader(title = 'Car Accidents in the United States from 2020 - 2023'),
              
              
              ## Menu Titles #############################################################################################################################
              
              dashboardSidebar(
                sidebarMenu(
                  
                  menuItem('Dataset Information', tabName = 'info', icon = icon('question-circle')),
                  
                  menuItem('How to Use the App', tabName = 'howto', icon = icon('user-circle')),
                  
                  menuItem('Exploratory Leaflet Map', tabName = 'leaf1', icon = icon('map')),
                  
                  menuItem('Leaflet Map with Filtering', tabName = 'leaf2', icon = icon('map')),
                  
                  menuItem('Accidents by Day', tabName = 'day', icon = icon('bar-chart')),
                  
                  menuItem('Accidents by Month', tabName = 'month', icon = icon('bar-chart')),
                  
                  menuItem('Accidents by Year', tabName = 'year', icon = icon('bar-chart')),
                  
                  menuItem('Traffic Control Features', tabName ='traffic', icon = icon('bar-chart')),
                  
                  menuItem('Accidents Adjusted for Population', tabName = 'population', icon = icon('database')),
                  
                  menuItem('Conclusion', tabName = 'conclusion', icon = icon('comment'))
                  
                )
              ),
              
              
              
              ## Dashboard Body Content ####################################################################################################################
              
              dashboardBody(
                
                
                tabItems(
                  
                  # Leaflet 1 Filter-------------------------------------------------------------------------------------------------------------------------
                  tabItem(tabName = 'leaf1', 
                          h2('Accident Frequency in the US by Severity'),
                          fluidRow(leafletOutput('map', height = '500px', width = '800px'))
                  ),
                  
                  
                  # Leaflet 2 Filter  -----------------------------------------------------------------------------------------------------------------------
                  tabItem(tabName = 'leaf2', 
                          h2('Accident Frequency by State Selection'),
                          fluidRow(column(title = 'Select Severity', 
                                          width = 6, 
                                          selectInput('Severity_Input_Leaflet',
                                                      'Select Severity of Accident:',
                                                      choices = c('All Severities'= 'All', '1' = 1, '2' = 2, '3' = 3, '4' = 4),
                                                      selected = 'All Severities'))),
                          fluidRow(column(title = 'Select Time', 
                                          width = 6, 
                                          selectInput('Time_Input_Leaflet',
                                                      'Select Day or Night:',
                                                      choices = c('Both (Day and Night)' = 'All','Day', 'Night'),
                                                      selected = 'Both'))),
                          fluidRow(column(title = 'Select Time', 
                                          width = 6, 
                                          selectInput('State_Input_Leaflet',
                                                      'Select a State:',
                                                      choices = c('All States' = 'All',"AL", "AK", "AZ", 
                                                                  "AR", "CA", "CO", "CT", "DE", "FL", 
                                                                  "GA", "HI", "ID", "IL", "IN", "IA", 
                                                                  "KS", "KY", "LA", "ME", "MD", "MA", 
                                                                  "MI", "MN", "MS", "MO", "MT", "NE", 
                                                                  "NV", "NH", "NJ", "NM", "NY", "NC", 
                                                                  "ND", "OH", "OK", "OR", "PA", "RI", 
                                                                  "SC", "SD", "TN", "TX", "UT", "VT", 
                                                                  "VA", "WA", "WV", "WI", "WY"),
                                                      selected = 'NY'))),
                          
                          fluidRow(column(title = 'Select Hour', 
                                          width = 6, 
                                          selectInput('Hour_Input_Leaflet',
                                                      'Select Time:',
                                                      choices = c('All Hours' = 'All', '12:00 AM' = 0, '1:00 AM' = 1, '2:00 AM' = 2, '3:00 AM' = 3, '4:00 AM' = 4, 
                                                                  '5:00 AM' = 5, '6:00 AM' = 6, '7:00 AM' = 7, '8:00 AM' = 8, '9:00 AM' = 9, '10:00 AM' = 10,
                                                                  '11:00 AM' = 11, '12:00 PM' = 12, '1:00 PM' = 13, '2:00 PM' = 14, '3:00 PM' = 15,
                                                                  '4:00 PM' = 16, '5:00 PM' = 17, '6:00 PM' = 18, '7:00 PM' = 19, '8:00 PM' = 20,
                                                                  '9:00 PM' = 21, '10:00 PM' = 22, '11:00 PM' = 23),
                                                      selected = 'All'))),
                          
                          fluidRow(column(title = 'Select Year', 
                                          width = 6, 
                                          selectInput('Year_Input_Leaflet',
                                                      'Select a Year:',
                                                      choices = c('All Years' = 'All','2020' = 2020,'2021' = 2021, '2022' = 2022),
                                                      selected = 'All'))),
                          
                          
                          fluidRow(column(title = 'Select Weather Condition',
                                          width = 6,
                                          selectInput('Weather_Input_Leaflet',
                                                      'Select Condition:',
                                                      choices = c('All Weather Conditions' = 'All', 'Rainy Conditions', 'Snowy Conditions', 'Cloudy Conditions',
                                                                  'Visibility Conditions', 'Thunderstorm Conditions', 'Extreme Weather Conditions',
                                                                  'Windy Conditions', 'Fair Conditions', 'Unknown Conditions'
                                                      ),
                                                      selected = 'All'))),
                          fluidRow(leafletOutput('map_2', height = '500px', width = '800px'))
                          
                  ),
                  
                  
                  
                  
                  # Accidents by Day Histogram UI Filters---------------------------------------------------------------------------------------------------
                  tabItem(tabName = 'day', h2('Accidents by Day'),
                          fluidRow(column(title = 'Select Severity', 
                                          width = 6, 
                                          selectInput('Severity_Input_Day',
                                                      'Select Severity of Accident:',
                                                      choices = c('All Severities'= 'All', '1' = 1, '2' = 2, '3' = 3, '4' = 4),
                                                      selected = 'All Severities'))),
                          fluidRow(column(title = 'Select Day or Night', 
                                          width = 6, 
                                          selectInput('Time_Input_Day',
                                                      'Select Day or Night:',
                                                      choices = c('Both (Day and Night)' = 'All','Day', 'Night'),
                                                      selected = 'Both'))),
                          fluidRow(column(title = 'Select State', 
                                          width = 6, 
                                          selectInput('State_Input_Day',
                                                      'Select a State:',
                                                      choices = c('All States' = 'All',"AL", "AK", "AZ", 
                                                                  "AR", "CA", "CO", "CT", "DE", "FL", 
                                                                  "GA", "HI", "ID", "IL", "IN", "IA", 
                                                                  "KS", "KY", "LA", "ME", "MD", "MA", 
                                                                  "MI", "MN", "MS", "MO", "MT", "NE", 
                                                                  "NV", "NH", "NJ", "NM", "NY", "NC", 
                                                                  "ND", "OH", "OK", "OR", "PA", "RI", 
                                                                  "SC", "SD", "TN", "TX", "UT", "VT", 
                                                                  "VA", "WA", "WV", "WI", "WY"),
                                                      selected = 'All'))),
                          
                          fluidRow(column(title = 'Select Hour', 
                                          width = 6, 
                                          selectInput('Hour_Input_Day',
                                                      'Select Time:',
                                                      choices = c('All Hours' = 'All', '12:00 AM' = 0, '1:00 AM' = 1, '2:00 AM' = 2, '3:00 AM' = 3, '4:00 AM' = 4, 
                                                                  '5:00 AM' = 5, '6:00 AM' = 6, '7:00 AM' = 7, '8:00 AM' = 8, '9:00 AM' = 9, '10:00 AM' = 10,
                                                                  '11:00 AM' = 11, '12:00 PM' = 12, '1:00 PM' = 13, '2:00 PM' = 14, '3:00 PM' = 15,
                                                                  '4:00 PM' = 16, '5:00 PM' = 17, '6:00 PM' = 18, '7:00 PM' = 19, '8:00 PM' = 20,
                                                                  '9:00 PM' = 21, '10:00 PM' = 22, '11:00 PM' = 23),
                                                      selected = 'All'))),
                          fluidRow(column(title = 'Select Year', 
                                          width = 6, 
                                          selectInput('Year_Input_Day',
                                                      'Select a Year:',
                                                      choices = c('All Years' = 'All','2020' = 2020,'2021' = 2021, '2022' = 2022),
                                                      selected = 'All'))),
                          
                          fluidRow(column(title = 'Select Weather Condition',
                                          width = 6,
                                          selectInput('Weather_Input_Day',
                                                      'Select Condition:',
                                                      choices = c('All Weather Conditions' = 'All', 'Rainy Conditions', 'Snowy Conditions', 'Cloudy Conditions',
                                                                  'Visibility Conditions', 'Thunderstorm Conditions', 'Extreme Weather Conditions',
                                                                  'Windy Conditions', 'Fair Conditions', 'Unknown Conditions'
                                                      ),
                                                      selected = 'All'))),
                          fluidRow(box(plotOutput("histogram_day")))
                          
                          
                          
                          
                  ),
                  
                  # Accidents by Month Histogram UI Filters----------------------------------------------------------------------------------------------------
                  tabItem(tabName = 'month', h2('Accidents by Month'), 
                          fluidRow(column(title = 'Select Severity', 
                                          width = 6, 
                                          selectInput('Severity_Input_Month',
                                                      'Select Severity of Accident:',
                                                      choices = c('All Severities'= 'All', '1' = 1, '2' = 2, '3' = 3, '4' = 4),
                                                      selected = 'All Severities'))),
                          fluidRow(column(title = 'Select Time', 
                                          width = 6, 
                                          selectInput('Time_Input_Month',
                                                      'Select Day or Night:',
                                                      choices = c('Both (Day and Night)' = 'All','Day', 'Night'),
                                                      selected = 'Both'))),
                          fluidRow(column(title = 'Select Time', 
                                          width = 6, 
                                          selectInput('State_Input_Month',
                                                      'Select a State:',
                                                      choices = c('All States' = 'All',"AL", "AK", "AZ", 
                                                                  "AR", "CA", "CO", "CT", "DE", "FL", 
                                                                  "GA", "HI", "ID", "IL", "IN", "IA", 
                                                                  "KS", "KY", "LA", "ME", "MD", "MA", 
                                                                  "MI", "MN", "MS", "MO", "MT", "NE", 
                                                                  "NV", "NH", "NJ", "NM", "NY", "NC", 
                                                                  "ND", "OH", "OK", "OR", "PA", "RI", 
                                                                  "SC", "SD", "TN", "TX", "UT", "VT", 
                                                                  "VA", "WA", "WV", "WI", "WY"),
                                                      selected = 'All'))),
                          
                          fluidRow(column(title = 'Select Hour', 
                                          width = 6, 
                                          selectInput('Hour_Input_Month',
                                                      'Select Time:',
                                                      choices = c('All Hours' = 'All', '12:00 AM' = 0, '1:00 AM' = 1, '2:00 AM' = 2, '3:00 AM' = 3, '4:00 AM' = 4, 
                                                                  '5:00 AM' = 5, '6:00 AM' = 6, '7:00 AM' = 7, '8:00 AM' = 8, '9:00 AM' = 9, '10:00 AM' = 10,
                                                                  '11:00 AM' = 11, '12:00 PM' = 12, '1:00 PM' = 13, '2:00 PM' = 14, '3:00 PM' = 15,
                                                                  '4:00 PM' = 16, '5:00 PM' = 17, '6:00 PM' = 18, '7:00 PM' = 19, '8:00 PM' = 20,
                                                                  '9:00 PM' = 21, '10:00 PM' = 22, '11:00 PM' = 23),
                                                      selected = 'All'))),
                          
                          fluidRow(column(title = 'Select Year', 
                                          width = 6, 
                                          selectInput('Year_Input_Month',
                                                      'Select a Year:',
                                                      choices = c('All Years' = 'All','2020' = 2020,'2021' = 2021, '2022' = 2022),
                                                      selected = 'All'))),
                          
                          fluidRow(column(title = 'Select Weather Condition',
                                          width = 6,
                                          selectInput('Weather_Input_Month',
                                                      'Select Condition:',
                                                      choices = c('All Weather Conditions' = 'All', 'Rainy Conditions', 'Snowy Conditions', 'Cloudy Conditions',
                                                                  'Visibility Conditions', 'Thunderstorm Conditions', 'Extreme Weather Conditions',
                                                                  'Windy Conditions', 'Fair Conditions', 'Unknown Conditions'
                                                      ),
                                                      selected = 'All'))),
                          fluidRow(box(plotOutput("histogram_month")))
                          
                  ),
                  # Accidents by Year Histogram UI Filters----------------------------------------------------------------------------------------------------
                  tabItem(tabName = 'year', h2('Accidents by Year'), 
                          fluidRow(column(title = 'Select Severity', 
                                          width = 6, 
                                          selectInput('Severity_Input_Year',
                                                      'Select Severity of Accident:',
                                                      choices = c('All Severities'= 'All', '1' = 1, '2' = 2, '3' = 3, '4' = 4),
                                                      selected = 'All Severities'))),
                          fluidRow(column(title = 'Select Time', 
                                          width = 6, 
                                          selectInput('Time_Input_Year',
                                                      'Select Day or Night:',
                                                      choices = c('Both (Day and Night)' = 'All','Day', 'Night'),
                                                      selected = 'Both'))),
                          fluidRow(column(title = 'Select Time', 
                                          width = 6, 
                                          selectInput('State_Input_Year',
                                                      'Select a State:',
                                                      choices = c('All States' = 'All',"AL", "AK", "AZ", 
                                                                  "AR", "CA", "CO", "CT", "DE", "FL", 
                                                                  "GA", "HI", "ID", "IL", "IN", "IA", 
                                                                  "KS", "KY", "LA", "ME", "MD", "MA", 
                                                                  "MI", "MN", "MS", "MO", "MT", "NE", 
                                                                  "NV", "NH", "NJ", "NM", "NY", "NC", 
                                                                  "ND", "OH", "OK", "OR", "PA", "RI", 
                                                                  "SC", "SD", "TN", "TX", "UT", "VT", 
                                                                  "VA", "WA", "WV", "WI", "WY"),
                                                      selected = 'All'))),
                          
                          fluidRow(column(title = 'Select Hour', 
                                          width = 6, 
                                          selectInput('Hour_Input_Year',
                                                      'Select Time:',
                                                      choices = c('All Hours' = 'All', '12:00 AM' = 0, '1:00 AM' = 1, '2:00 AM' = 2, '3:00 AM' = 3, '4:00 AM' = 4, 
                                                                  '5:00 AM' = 5, '6:00 AM' = 6, '7:00 AM' = 7, '8:00 AM' = 8, '9:00 AM' = 9, '10:00 AM' = 10,
                                                                  '11:00 AM' = 11, '12:00 PM' = 12, '1:00 PM' = 13, '2:00 PM' = 14, '3:00 PM' = 15,
                                                                  '4:00 PM' = 16, '5:00 PM' = 17, '6:00 PM' = 18, '7:00 PM' = 19, '8:00 PM' = 20,
                                                                  '9:00 PM' = 21, '10:00 PM' = 22, '11:00 PM' = 23),
                                                      selected = 'All'))),
                          fluidRow(column(title = 'Select Weather Condition',
                                          width = 6,
                                          selectInput('Weather_Input_Year',
                                                      'Select Condition:',
                                                      choices = c('All Weather Conditions' = 'All', 'Rainy Conditions', 'Snowy Conditions', 'Cloudy Conditions',
                                                                  'Visibility Conditions', 'Thunderstorm Conditions', 'Extreme Weather Conditions',
                                                                  'Windy Conditions', 'Fair Conditions', 'Unknown Conditions'
                                                      ),
                                                      selected = 'All'))),
                          fluidRow(box(plotOutput("histogram_year")))
                          
                  ),
                  
                  
                  # Accidents by Population Tab---------------------------------------------------------------------------------------------------------
                  tabItem(tabName = 'population', h2('Accidents Per 100,000 People'),
                          fluidRow(column(title = 'Select Column', 
                                          width = 6, 
                                          selectInput('pop_col',
                                                      'Select Column:',
                                                      choices = c('2020 Accidents' = "Accidents_Per_100k_2020", '2021 Accidents' = "Accidents_Per_100k_2021", 
                                                                  '2022 Accidents' = "Accidents_Per_100k_2022"),
                                                      selected = '2020 Accidents'))),
                          fluidRow(column(title = 'Select Top or Bottom 5 States', 
                                          width = 6, 
                                          selectInput('top_bot',
                                                      'Select Top or Bottom 5 States:',
                                                      choices = c('Top 5 States' = 'Top 5', 'Bottom 5 States' = 'Bottom 5'),
                                                      selected = 'Top 5 States'))),
                          fluidRow(box(plotOutput('population_graph')))
                          
                          
                  ),
                  
                  # Dataset Information Tab - Written---------------------------------------------------------------------------------------------------
                  tabItem(tabName = 'info', h2('App Information'),
                          HTML('<h4><strong>Dataset Information</strong></h4>
                   <p>
                   This project explores a dataset about car accidents in the US from Kaggle.com. You can find the dataset <a href="https://www.kaggle.com/datasets/sobhanmoosavi/us-accidents">here</a> for reference. It contains approximately 7.7 million records of accidents across 49 states from February 2016 to March 2023. The data was collected from various traffic APIs and includes additional features such as weather conditions during the accident, the time of the accident, and whether the accident occurred near a traffic control feature/obstacle. These features will be explored in this app.
                 </p>
                   
                   <h4><strong>Dataset Transformation</strong></h4>
                   <p>
                   The dataset was transformed for optimization in an R Shiny app. Any records with missing values were removed, and the analysis focused on the most complete years, which were 2020 to 2022, the other years were removed. The resulting dataset still contained a large amount of records at around 3.1 million, which was still too large for the application. Because of this the data was sampled with a seed of 1 and stratified by State resulting in 313 thousand records. This amount allows the application to run more smoothly and load in a reasonable time. The full dataset along with the code to use it in an rshiny app can found on my github page <a href="https://github.com/zmactag?tab=repositories">here</a>.
                 </p>
                   
                   <h4><strong>Variable Explanation</strong></h4>
                   <ul>
                   <li><strong>Severity:</strong> Indicates the severity of the accident\'s impact on traffic.</li>
                   <li><strong>Traffic Feature:</strong> Indicates the accident was near a traffic feature or obstacle such as a stop light or junction.</li>
    <li><strong>Location Details:</strong> Provides information about when and where the accident occurred, including the hour, day, month, year, state, latitude, and longitude.</li>
    <li><strong>Description:</strong> Offers a written description of the accident, often including road names and notes about nearby traffic impact.</li>
    <li><strong>Sunrise or Sunset:</strong> Specifies whether the accident occurred during the daytime or nighttime.</li>
    <li><strong>Weather Conditions:</strong> Describes the weather conditions during the time of the accident. This variable has been categorized into the following subcategories for clarity:
        <ul>
            <li>Rainy Conditions (includes light rain, heavy rain, drizzle, etc.)</li>
            <li>Snowy Conditions (includes snow, light snow, heavy snow, sleet, etc.)</li>
            <li>Cloudy Conditions (includes cloudy, mostly cloudy, partly cloudy, etc.)</li>
            <li>Visibility Conditions (includes fog, haze, mist, smoke, blowing dust, patches of fog, and partial fog)</li>
            <li>Thunderstorm Conditions (thunder, thunderstorms, heavy thunder-storm, etc.)</li>
            <li>Extreme Weather Conditions (tornado, blizzard, hurricane, squall, dust whirlwinds)</li>
            <li>Windy Conditions (fair/windy, cloudy/windy, etc.)</li>
            <li>Fair Conditions (fair conditions)</li>
            <li>Unknown Conditions (blank, N/A, or No Measurement/Error)</li>
        </ul>
    </li>
</ul>
                 
                 <h4><strong>Acknowledgements</strong></h4>
<p>
    Thank you to the authors for making this data publicly available and allowing me to transform and visualize it. And thank you to my mentor Denis from NYCDSA for helping guide me throughout this project.
    <br>
    <strong>Sources:</strong>
    <ul style="list-style-type: square; margin-left: 20px;">
        <li>Moosavi, Sobhan, Mohammad Hossein Samavatian, Srinivasan Parthasarathy, and Rajiv Ramnath. “A Countrywide Traffic Accident Dataset,” 2019.</li>
        <li>Moosavi, Sobhan, Mohammad Hossein Samavatian, Srinivasan Parthasarathy, Radu Teodorescu, and Rajiv Ramnath. "Accident Risk Prediction based on Heterogeneous Sparse Data: New Dataset and Insights." In proceedings of the 27th ACM SIGSPATIAL International Conference on Advances in Geographic Information Systems, ACM, 2019.</li>
    </ul>
    <br>
    License used from original dataset: <a href="https://creativecommons.org/licenses/by-nc-sa/4.0/">Creative Commons — Attribution-NonCommercial-ShareAlike 4.0 International — CC BY-NC-SA 4.0</a>
</p>'
                               
                          )
                  ),
                  
                  
                  # How to Use App - Written------------------------------------------------------------------------------------------------------------
                  tabItem(tabName = 'howto', h2('How to Use App'),
                          
                          HTML('<h3><strong>Tab Information and How to Use Them</strong></h3>
<p>
    The application has ten tabs consisting of Leaflet map plots, bar graphs, and written tabs. The three written tabs, "Dataset Information," "How to Use App," and "Conclusion," contain text corresponding to their titles. The tabs are accessed through the top left hamburger menu icon and allows the user to click through the other tab options.
</p>

<p>
    There are two Leaflet map plots in the app that display accidents based on their latitude and longitude on a map of the US. The accidents are also color coded by their severity (refer to the legend colors for each severity). These maps use clustering to group the nearby accidents together to prevent all the accidents from being displayed simultaneously on the map. To view the individual accidents, simply zoom in on the map using your scroll wheel or the +/- buttons in the top left corner of the map. Hovering over the individual accident circle will bring up a text box with the description of that accident.
</p>

<p>
    The second Leaflet map has filtering options located above the map. The filtering options allow users to select multiple filters for the data and see how it changes the data and its visualization. All filtering used dynamically changes the graphs or plots and will take a second to load.
</p>

<p>
    The remaining tabs consist of graphs that also offer filtering options similar to the second Leaflet map. Below is also a brief description of each tab.
                 </p>
                   
                   <p>
                   - \"Accidents by Day\" displays the number of accidents across days of the week. 
                 </p>
                   
                   <p>
                   - \"Accidents by Month\" displays the number of accidents for each month.
                 </p>
                   
                   <p>
                   - \"Accidents by Year\" displays the number of accidents for years 2020, 2021, and 2022. Please note that the years 2020 and 2021 were affected by the COVID-19 pandemic at different rates, so the data may not represent typical frequencies for a non-pandemic setting. Although it could provide insights into how accident frequencies changed as the pandemic restrictions were slowly lifted.
                 </p>
                   
                   <p>
                   - \"Accidents by Traffic Obstacle\" displays the number of accidents for the top four traffic features/obstacles in the dataset.
                 </p>
                   
                   <p>
                   - \"Accident Rates per 100k\" displays the top five and bottom five states with the highest and lowest accident rates per 100,000 people of their population. Filtering options include selecting specific years and states. Population data for each state and year was sourced from <a href="https://data.census.gov">the United States Census Bureau website.</a>
                 </p>
                 
                 ')
                  ),
                  
                  # Accidents by Traffic Conditions UI Inputs ----------------------------------------------------------------------------------------------------------
                  tabItem(tabName = 'traffic', h2('Accidents by Traffic Control Feature'),
                          fluidRow(column(title = 'Select Severity', 
                                          width = 6, 
                                          selectInput('Severity_Input_Traffic',
                                                      'Select Severity of Accident:',
                                                      choices = c('All Severities'= 'All', '1' = 1, '2' = 2, '3' = 3, '4' = 4),
                                                      selected = 'All Severities'))),
                          fluidRow(column(title = 'Select Time', 
                                          width = 6, 
                                          selectInput('Time_Input_Traffic',
                                                      'Select Day or Night:',
                                                      choices = c('Both (Day and Night)' = 'All','Day', 'Night'),
                                                      selected = 'Both'))),
                          fluidRow(column(title = 'Select Time', 
                                          width = 6, 
                                          selectInput('State_Input_Traffic',
                                                      'Select a State:',
                                                      choices = c('All States' = 'All',"AL", "AK", "AZ", 
                                                                  "AR", "CA", "CO", "CT", "DE", "FL", 
                                                                  "GA", "HI", "ID", "IL", "IN", "IA", 
                                                                  "KS", "KY", "LA", "ME", "MD", "MA", 
                                                                  "MI", "MN", "MS", "MO", "MT", "NE", 
                                                                  "NV", "NH", "NJ", "NM", "NY", "NC", 
                                                                  "ND", "OH", "OK", "OR", "PA", "RI", 
                                                                  "SC", "SD", "TN", "TX", "UT", "VT", 
                                                                  "VA", "WA", "WV", "WI", "WY"),
                                                      selected = 'All'))),
                          
                          fluidRow(column(title = 'Select Hour', 
                                          width = 6, 
                                          selectInput('Hour_Input_Traffic',
                                                      'Select Time:',
                                                      choices = c('All Hours' = 'All', '12:00 AM' = 0, '1:00 AM' = 1, '2:00 AM' = 2, '3:00 AM' = 3, '4:00 AM' = 4, 
                                                                  '5:00 AM' = 5, '6:00 AM' = 6, '7:00 AM' = 7, '8:00 AM' = 8, '9:00 AM' = 9, '10:00 AM' = 10,
                                                                  '11:00 AM' = 11, '12:00 PM' = 12, '1:00 PM' = 13, '2:00 PM' = 14, '3:00 PM' = 15,
                                                                  '4:00 PM' = 16, '5:00 PM' = 17, '6:00 PM' = 18, '7:00 PM' = 19, '8:00 PM' = 20,
                                                                  '9:00 PM' = 21, '10:00 PM' = 22, '11:00 PM' = 23),
                                                      selected = 'All'))),
                          
                          fluidRow(column(title = 'Select Year', 
                                          width = 6, 
                                          selectInput('Year_Input_Traffic',
                                                      'Select a Year:',
                                                      choices = c('All Years' = 'All','2020' = 2020,'2021' = 2021, '2022' = 2022),
                                                      selected = 'All'))),
                          
                          fluidRow(column(title = 'Select Weather Condition',
                                          width = 6,
                                          selectInput('Weather_Input_Traffic',
                                                      'Select Condition:',
                                                      choices = c('All Weather Conditions' = 'All', 'Rainy Conditions', 'Snowy Conditions', 'Cloudy Conditions',
                                                                  'Visibility Conditions', 'Thunderstorm Conditions', 'Extreme Weather Conditions',
                                                                  'Windy Conditions', 'Fair Conditions', 'Unknown Conditions'
                                                      ),
                                                      selected = 'All'))),
                          fluidRow(box(plotOutput('traffic_graph')))
                          
                  ),
                  
                  # Conclusion Tab - Written----------------------------------------------------------------------------------------------------------
                  tabItem(tabName = 'conclusion', h2('Data Insights and Future Work'), 
                          HTML('<p><strong>Insights:</strong></p>
<ul>
    <li>Different states have different accident frequencies at different traffic obstacles. NYC has many accidents at traffic lights compared to other states most likely because it has more traffic lights in total than those states. Adding ratios for this feature from a geographic API would provide more insight.</li>
    <li>South Carolina being in the top 5 states for accidents per population across all years looked at in this project was interesting. Need to look deeper into the original dataset and it\'s features to gain an insight into why as it is not a state I thought would be in the top 5 (would expect states like NY, CA, FL).</li>
    <li>Filtering by Year allows users to see the change in accident trends from the height of the pandemic to 2022. An interesting finding is that they were more accidents at 1:00 am during 2020 then 2021-2022.</li>
    <li>Accidents during the night increase on the weekends compared to the weekdays.</li>
    <li>Accidents during the day happen more frequently on the weekdays. Specific times, such as morning hours or rush hour, show higher accident rates on weekdays when more people are commuting to work.</li>
    <li>During late-night and early-morning hours, accidents increase on the weekends compared to weekdays, as these are the times when people tend to stay out later.</li>
</ul>

<p>
    This information, along with an analysis of how accident patterns change over the years, can help drivers make more informed decisions about when and where to drive. It can also help assist police and medical professionals who respond to accidents in planning their response to these car accidents and scheduling of staff. Adding other information such as age might also be valuable to address when or if older drivers need to be re-assessed for their license to continue to be able to drive safely.
</p>

<p><strong>Future Work:</strong></p>
<p>
    Future work on this project could involve incorporating additional information from traffic or geographic APIs. Information I am interested in adding from APIs to this app includes the number of lanes at each accident location to see if more lanes have an impact on accident rates, amount of traffic control features in each state to calculate ratios for above insights, posted speed limits at each accident location to see if speed has any effect, and the proximity of the accident to places of interest (such as bars or other locations with higher alcohol use) to see if accidents occur more frequently near these locations. Demographic information, such as age, could also provide valuable insights, though ethical considerations would need to be taken into account beforehand. Other future work includes using machine learning techniques to help predict these accidents occuring. Machine learning techniques would lead to more robust and actionable insights for this dataset such as using classification models to predict accident severity based on other features in the dataset.
</p>')
                          
                  )
                  
                  
                  
                )
                
              )
              
)


