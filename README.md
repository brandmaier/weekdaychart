# Commits per Day of Week

This is a github action that creates a chart of recent project commits by day of week. Here is an example showing the most recent project commit counts per day of week:

![weekday.png](https://github.com/brandmaier/weekdaychart/blob/main/weekdays.png?raw=true)

The action can be automatically run on a regular schedule. Every time, it will update the chart with most recent information and commit and push the chart to your repository. So, you can use the chart in your project profile README file or integrate it in other contexts.

# How does it work

The action runs a virtual machine with Ubuntu and first installs R and the some R libraries (most importantly gh, dplyr, and ggplot2) from CRAN. Then, it fetches project data using the github API leveraging the 'gh' library. Plots are created using 'ggplot2' and are saved as PNG files for easy access.

# License

This project is free software and is licensed under the MIT license.
