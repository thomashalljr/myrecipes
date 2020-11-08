import React from "react";
import PropTypes from "prop-types";
import Button from "@material-ui/core/Button";
import { withStyles } from "@material-ui/core/styles";

const styles = theme => ({
  root: {
    margin: theme.spacing.unit,
    boxShadow: 'none',
    textTransform: 'none',
    fontSize: 16,
    padding: '6px 12px',
    border: '1px solid #fff',
    backgroundColor: '#073b15',
    fontFamily: [
      '-apple-system',
      'BlinkMacSystemFont',
      '"Segoe UI"',
      'Roboto',
      '"Helvetica Neue"',
      'Arial',
      'sans-serif',
      '"Apple Color Emoji"',
      '"Segoe UI Emoji"',
      '"Segoe UI Symbol"',
    ].join(','),
    '&:hover': {
      color: '#073b15',
      backgroundColor: '#FFF',
      borderColor: '#073b15',
    },
    '&:active': {
      boxShadow: 'none',
      backgroundColor: '#0062cc',
      borderColor: '#005cbf',
    },
    '&:focus': {
      boxShadow: '0 0 0 0.2rem rgba(0,123,255,.5)',
    },
  },
});

function SignupButton(props) {
  const { classes } = props;
  return (
    <Button
      variant="contained"
      href="/chefs/sign_up"
      color="primary"
      disableRipple
      className={classes.root}>
        Sign up
    </Button>
  );
}

SignupButton.propTypes = {
  classes: PropTypes.object.isRequired,
};

export default withStyles(styles)(SignupButton);
