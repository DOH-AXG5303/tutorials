import pandas as pd
import redcap

redcap_api_url = 'https://redcap.doh.wa.gov/api/'
api_token = 'API_token_goes_here'


project = redcap.Project(url = redcap_api_url, token=api_token)
df = project.export_records(format_type = "df")