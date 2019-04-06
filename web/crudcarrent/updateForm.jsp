<%-- 
    Document   : form
    Created on : Apr 6, 2019, 2:29:52 PM
    Author     : anarx
--%>

<%@page import="az.automobile.model.Automobile"%>
<%@page import="az.automobile.fileops.AutoFileOps"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>



        <title>jQuery UI Autocomplete - Combobox</title>
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

        <style>

            body {
                font-family: Arial, Helvetica, sans-serif;
            }

            table {
                font-size: 1em;
            }

            .ui-draggable, .ui-droppable {
                background-position: top;
            } 

            .custom-combobox {
                position: relative;
                display: inline-block;
            }
            .custom-combobox-toggle {
                position: absolute;
                top: 0;
                bottom: 0;
                margin-left: -1px;
                padding: 0;
            }
            .custom-combobox-input {
                margin: 0;
                padding: 5px 10px;
            }
        </style>
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <script>
            $(function () {
                $.widget("custom.combobox", {
                    _create: function () {
                        this.wrapper = $("<span>")
                                .addClass("custom-combobox")
                                .insertAfter(this.element);

                        this.element.hide();
                        this._createAutocomplete();
                        this._createShowAllButton();
                    },

                    _createAutocomplete: function () {
                        var selected = this.element.children(":selected"),
                                value = selected.val() ? selected.text() : "";

                        this.input = $("<input>")
                                .appendTo(this.wrapper)
                                .val(value)
                                .attr("title", "")
                                .addClass("custom-combobox-input ui-widget ui-widget-content ui-state-default ui-corner-left")
                                .autocomplete({
                                    delay: 0,
                                    minLength: 0,
                                    source: $.proxy(this, "_source")
                                })
                                .tooltip({
                                    classes: {
                                        "ui-tooltip": "ui-state-highlight"
                                    }
                                });

                        this._on(this.input, {
                            autocompleteselect: function (event, ui) {
                                ui.item.option.selected = true;
                                this._trigger("select", event, {
                                    item: ui.item.option
                                });
                            },

                            autocompletechange: "_removeIfInvalid"
                        });
                    },

                    _createShowAllButton: function () {
                        var input = this.input,
                                wasOpen = false;

                        $("<a>")
                                .attr("tabIndex", -1)
                                .attr("title", "Show All Items")
                                .tooltip()
                                .appendTo(this.wrapper)
                                .button({
                                    icons: {
                                        primary: "ui-icon-triangle-1-s"
                                    },
                                    text: false
                                })
                                .removeClass("ui-corner-all")
                                .addClass("custom-combobox-toggle ui-corner-right")
                                .on("mousedown", function () {
                                    wasOpen = input.autocomplete("widget").is(":visible");
                                })
                                .on("click", function () {
                                    input.trigger("focus");

                                    // Close if already visible
                                    if (wasOpen) {
                                        return;
                                    }

                                    // Pass empty string as value to search for, displaying all results
                                    input.autocomplete("search", "");
                                });
                    },

                    _source: function (request, response) {
                        var matcher = new RegExp($.ui.autocomplete.escapeRegex(request.term), "i");
                        response(this.element.children("option").map(function () {
                            var text = $(this).text();
                            if (this.value && (!request.term || matcher.test(text)))
                                return {
                                    label: text,
                                    value: text,
                                    option: this
                                };
                        }));
                    },

                    _removeIfInvalid: function (event, ui) {

                        // Selected an item, nothing to do
                        if (ui.item) {
                            return;
                        }

                        // Search for a match (case-insensitive)
                        var value = this.input.val(),
                                valueLowerCase = value.toLowerCase(),
                                valid = false;
                        this.element.children("option").each(function () {
                            if ($(this).text().toLowerCase() === valueLowerCase) {
                                this.selected = valid = true;
                                return false;
                            }
                        });

                        // Found a match, nothing to do
                        if (valid) {
                            return;
                        }

                        // Remove invalid value
                        this.input
                                .val("")
                                .attr("title", value + " didn't match any item")
                                .tooltip("open");
                        this.element.val("");
                        this._delay(function () {
                            this.input.tooltip("close").attr("title", "");
                        }, 2500);
                        this.input.autocomplete("instance").term = "";
                    },

                    _destroy: function () {
                        this.wrapper.remove();
                        this.element.show();
                    }
                });

                $("#combobox").combobox();
                $("#toggle").on("click", function () {
                    $("#combobox").toggle();
                });
            });
        </script>



    </head>



    <body>

        <%String id = request.getParameter("id");
            AutoFileOps afo = new AutoFileOps();
            Automobile a = afo.getAutoById(id);

        %>

        <div class="container">
            <div class="row">
                <div class="col-lg-3" style="background-color:lavender;"><p>1-div</p></div>

                <div class="col-lg-6" style="background-color:lavenderblush;">
                    <h2>New Car input</h2>
                    <form action="updatcar.jsp" method="GET">

                        <div class="form-group">
                            <label for="id">Model</label>
                            <input type="text" class="form-control" id="id" 
                                   name="id"
                                   value="<%= a.getId()%>" readonly="">
                        </div>

                        <div class="form-group">
                            <label for="marka">Marka</label>
                            <div class="ui-widget">

                                <select id="combobox" name="marka">
                                    <option value="">Select one...</option>
                                    <option value="Lada">Lada</option>
                                    <option value="BMW">BMW</option>
                                    <option value="Mercedes">Mercedes-Benz</option>
                                    <option value="Toyota">Toyota</option>

                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="model">Model</label>
                            <input type="text" class="form-control" id="model" 
                                   placeholder="Enter model" name="model"
                                   value="<%= a.getModel()%>">
                        </div>




                        <div class="form-group">
                            <label for="type">Type</label>
                            <select class="form-control" id="type" name="type">
                                <option value="Sedan">Sedan</option>
                                <option value="Jeep">Jeep</option>
                                <option value="Hetchback">Hetchback</option>
                                <option value="Universal">Universal</option>
                                <option value="Coupe">Coupe</option>
                            </select>
                        </div>


                        <div class="form-group">
                            <label for="year">Year</label>
                            <input type="number" class="form-control" id="year" 
                                   placeholder="Enter year" name="year"
                                   value="<%= a.getYear()%>">
                        </div>
                        <div class="form-group">
                            <label for="motor">Motor</label>
                            <input type="number" class="form-control" id="motor" 
                                   placeholder="Enter motor" name="motor"
                                   value="<%= a.getMotor()%>">
                        </div>

                        <div class="form-group">
                            <label for="color">Color</label>
                            <input type="text" class="form-control" id="color" 
                                   placeholder="Enter Color" name="color"
                                   value="<%= a.getColor()%>">
                        </div>

                        <div class="form-group">
                            <label for="transmission">Transmission</label>
                            <select class="form-control" id="transmission" name="transmission">
                                <option value="Automatic">Automatic</option>
                                <option value="Manual">Manual</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="price">Price</label>
                            <input type="text" class="form-control" id="price" 
                                   placeholder="Enter Price" name="price"
                                   value="<%= a.getPrice()%>">
                        </div>

                        <button type="submit" class="btn btn-default">Update</button>
                    </form>
                </div>
                <div class="col-lg-3" style="background-color:lavender;"><p>3-cu div</p></div>
            </div>
        </div>
    </body>
</html>
