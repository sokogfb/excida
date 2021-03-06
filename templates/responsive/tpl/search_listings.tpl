<div class="container">

    <div id="main">
        <div class="row">
            <div class="span12">
                <h1 class="page-header">{header}</h1>
                
                {output_message}
                
            </div>
            
            <div class="span<?php if ( $conf['show_calendar'] == 'ON' ) { echo '9'; } else { echo '12'; } ?>">
                
                <?php if ( $conf['show_calendar'] == 'ON' ) { $col_width = '3'; } else { $col_width = '4'; } ?>

				<form method="post" action="<?php echo URL; ?>/search_listings_results.php">
				
				<h3>{@location}</h3>
				
				<div class="row">
					<div class="span<?php echo $col_width; ?>">
						<div class="bathrooms control-group">
			                <label class="control-label" for="inputAddress">
			                    {@address}
			                </label>
			                <div class="controls">
			                    <input type="text" name="address1" value="{address}" id="inputAddress">
			                </div><!-- /.controls -->
			            </div><!-- /.control-group -->
					</div>
					
					<div class="span<?php echo $col_width; ?>">
						<div class="control-group">
			                <label class="control-label" for="inputPropertyLocation">
			                    {@location}
			                </label>
			                <div class="controls">
			                    <select name="location1" id="location1">
			                    	{location1}
			                    </select>
			                    <select name="location2" id="location2">
			                    </select>
			                    <select name="location3" id="location3">
			                    </select>                    
			                </div><!-- /.controls -->
			            </div><!-- /.control-group -->
					</div>
					
					<div class="span<?php echo $col_width; ?>">
						<?php if ( $conf['show_postal_code'] == 'ON' ) { ?>
						    <div class="control-group">
						        <label class="control-label" for="zip">
						            {@zip}
						        </label>
						        <div class="controls">
						            <input type="text" id="zip" name="zip" value="{zip}">
						        </div><!-- /.controls -->
						    </div><!-- /.control-group -->
						
						
							<div class="control-group">
						        <label class="control-label" for="radius">
						            {@radius}
						        </label>
						        <div class="controls">
						            <select name="radius">
						            	<option value="">{select}</option>
						            	<?php
						            	
						            	$radius_options = array(
						            		1, 5, 10, 15, 20, 25, 30, 50, 100
						            	);
						            	foreach ( $radius_options AS $option )
						            	{
						            		echo '<option value="' . $option . '">' . $option . '</option>';
						            	}
						            	
						            	?>
						            </select>
						        </div><!-- /.controls -->
						    </div><!-- /.control-group -->
					    <?php } ?>
					</div>
					
				</div>
				
				<div class="form-actions">
					<input type="submit" name="submit" class="btn btn-primary arrow-right" value="{search}">
					</form>
				</div><!-- /.form-actions -->
				
				<hr>
				
				<form method="post" action="<?php echo URL; ?>/search_listings_results.php">
				
				<h3>{@listing_details}</h3>
				
				<div class="row">
					<div class="span<?php echo $col_width; ?>">
						<div class="bedrooms control-group">
			                <label class="control-label" for="status">
			                    {@status}
			                </label>
			                <div class="controls">
			                    <select name="status" id="status" class="none">
			                    	<option value="">{select}</option>
				                    <?php
				                    
				                    echo generate_options_list( STATUS_TABLE, $form['status'] );
				                    
				                    ?>
			                    </select>
			                </div><!-- /.controls -->
			            </div><!-- /.control-group -->

					</div>
				
					<div class="span<?php echo $col_width; ?>">
						<div id="price_range_purchase">								
							<div class="control-group">
				                <label class="control-label">
				                    {@from_price}
				                </label>
				                <div class="controls">
				                    <select name="price_range_purchase_min">
				                    	<option value="">{select}</option>
										<?php
										
										$prices = price_ranges( 'purchase' );
									
										foreach ( $prices AS $price )
										{
											echo '<option value="' . $price . '">' . $conf['currency'] . ' ' . pmr_number_format( $price ) . '</option>';
										}
										
										?>
				                    </select>
				                </div><!-- /.controls -->
				            </div><!-- /.control-group -->
						</div>
					</div>						
						
					<div class="span<?php echo $col_width; ?>">
						<div id="price_range_purchase">	
							<div class="control-group">
				                <label class="control-label">
				                    {@to_price}
				                </label>
				                <div class="controls">
				                    <select name="price_range_purchase_max">
				                    	<option value="">{select}</option>
										<?php
										
										$prices = price_ranges( 'purchase' );
										
										foreach ( $prices AS $price )
										{
											echo '<option value="' . $price . '">' . $conf['currency'] . ' ' . pmr_number_format( $price ) . '</option>';
										}
										
										?>
				                    </select>
				                </div><!-- /.controls -->
				            </div><!-- /.control-group -->
			            </div>
					</div>
				</div>
				
				<div class="row">
					<div class="span<?php echo $col_width; ?>">
						<div class="bedrooms control-group">
			                <label class="control-label" for="type">
			                    {@property_type}
			                </label>
			                <div class="controls">
			                    <select name="type" id="type">
			                    	<option value="">{select}</option>
				                    <?php
				                    
				                    echo generate_options_list( TYPES_TABLE, $form['type'] );
				                    
				                    ?>
			                    </select>
			                </div><!-- /.controls -->
			            </div><!-- /.control-group -->

					</div>
					
					<div class="span<?php echo $col_width; ?>">
						<div class="bathrooms control-group">
			                <label class="control-label" for="style">
			                    {@style}
			                </label>
			                <div class="controls">
			                    <select name="style" id="style">
			                    	<option value="">{select}</option>
				                    <?php
				                    
				                    echo generate_options_list( STYLES_TABLE, $form['style'] );
				                    
				                    ?>
			                    </select>
			                </div><!-- /.controls -->
			            </div><!-- /.control-group -->
					</div>
					
					<div class="span<?php echo $col_width; ?>">
						<div class="bathrooms control-group">
			                <label class="control-label" for="type2">
			                    {@listing_type}
			                </label>
			                <div class="controls">
			                    <select name="type2" id="type2" class="none">
			                    	<option value="">{select}</option>
				                    <?php
				                    
				                    echo generate_options_list( TYPES2_TABLE, $form['type2'] );
				                    
				                    ?>
			                    </select>
			                </div><!-- /.controls -->
			            </div><!-- /.control-group -->

					</div>
				</div>
				
				<div class="row">
					
					<div class="span<?php echo $col_width; ?>">
						<div class="bedrooms control-group">
			                <label class="control-label" for="bedrooms">
			                    {@bedrooms}
			                </label>
			                <div class="controls">
					            <select id="bedrooms" name="bedrooms">
					            	<option value="">{select}</option>
						            <?php
						            
						            for( $i = 1; $i <= 10; $i++ )
						            {
						            	$sel = ( $_REQUEST['bedrooms'] == $i ) ? ' selected' : '';
						            	echo '<option value="' . $i . '"' . $sel . '>' . $i . '</option>';
						            }
						            
						            ?>
					            </select>
			                </div><!-- /.controls -->
			            </div><!-- /.control-group -->
					</div>
										
										
					<div class="span<?php echo $col_width; ?>">
						<div class="bathrooms control-group">
			                <label class="control-label" for="bathrooms">
			                    {@bathrooms}
			                </label>
			                <div class="controls">
					            <select id="bathrooms" name="bathrooms">
					            	<option value="">{select}</option>
						            <?php
						            
						            for( $i = 1; $i <= 10; $i++ )
						            {
						            	$sel = ( $_REQUEST['bathrooms'] == $i ) ? ' selected' : '';
						            	echo '<option value="' . $i . '"' . $sel . '>' . $i . '</option>';
						            }
						            
						            ?>
					            </select>
			                </div><!-- /.controls -->
			            </div><!-- /.control-group -->
					</div>
					
					<div class="span<?php echo $col_width; ?>">
			            <div class="bedrooms control-group">
			                <label class="control-label" for="half_bathrooms">
			                    {@half_bathrooms}
			                </label>
			                <div class="controls">
					            <select id="half_bathrooms" name="half_bathrooms">
					            	<option value="">{select}</option>
						            <?php
						            
						            for( $i = 0; $i <= 10; $i++ )
						            {
						            	$sel = ( $_REQUEST['half_bathrooms'] == $i && $_REQUEST['half_bathrooms'] != '' ) ? ' selected' : '';
						            	echo '<option value="' . $i . '"' . $sel . '>' . $i . '</option>';
						            }
						            
						            ?>
					            </select>
			                </div><!-- /.controls -->
			            </div><!-- /.control-group -->
					</div>
				</div>
				
				<div class="form-actions">
					<input type="submit" name="submit" class="btn btn-primary arrow-right" value="{search}">
					</form>
				</div><!-- /.form-actions -->
				
				<hr>		
				
				<form method="post" action="<?php echo URL; ?>/search_listings_results.php">
				
				<h3>{@additional_criteria}</h3>
				
				<div class="row">
					<div class="span<?php echo $col_width; ?>">
						<div class="bedrooms control-group">
					        <label class="control-label" for="inputContactEmail">
					            {@garage}
					        </label>
					        <div class="controls">
					            <select name="garage" id="garage">
					            	<option value="">{select}</option>
									<?php
									
									echo generate_options_list( GARAGE_TABLE, $_REQUEST['garage'] );
									
									?>
					            </select>
					        </div><!-- /.controls -->
					    </div><!-- /.control-group -->					    
					</div>
					
					<div class="span<?php echo $col_width; ?>">
						<div class="bathrooms control-group">
					        <label class="control-label" for="garage_cars">
					            {@garage_cars}
					        </label>
					        <div class="controls">
					            <select name="garage_cars" id="garage_cars">
					            	<option value="">{select}</option>
						            <?php
			
						            for( $i = 0; $i <= 10; $i++ )
						            {
						            	$sel = ( $_REQUEST['garage_cars'] == $i && $_REQUEST['garage_cars'] != '' ) ? ' selected' : '';
						            	echo '<option value="' . $i . '"' . $sel . '>' . $i . '</option>';
						            }
						            
						            ?>
					            </select>
					        </div><!-- /.controls -->
					    </div><!-- /.control-group -->
					</div>
					
					<div class="span<?php echo $col_width; ?>">
						<div class="bathrooms control-group">
					        <label class="control-label" for="year_built">
					            {@year_built}
					        </label>
					        <div class="controls">
					            <select id="year_built" name="year_built">
					            	<option value="">{select}</option>
						            <?php
				
						            $cur_year = date( 'Y' );
						            
						            for( $i = $cur_year; $i >= 1800; $i-- )
						            {
						            	$sel = ( $_REQUEST['year_built'] == $i ) ? ' selected' : '';
						            	echo '<option value="' . $i . '"' . $sel . '>' . $i . '</option>';
						            }
						            
						            ?>
					            </select>
					        </div><!-- /.controls -->
					    </div><!-- /.control-group -->
					</div>
				</div>
				
				<div class="row">				
					
					<div class="span<?php echo $col_width; ?>">
						<div class="bedrooms control-group">
					        <label class="control-label" for="basement">
					            {@basement}
					        </label>
					        <div class="controls">
					            <select name="basement" id="basement">
					            	<option value="">{select}</option>
						            <?php
						            
						            echo generate_options_list( BASEMENT_TABLE, $_REQUEST['basement'] );
						            
						            ?>
					            </select>
					        </div><!-- /.controls -->
					    </div><!-- /.control-group -->  
					</div>
					
					<div class="span<?php echo $col_width; ?>">
						<div class="bathrooms control-group">
					        <label class="control-label" for="living_area">
					            {@living_area}
					        </label>
					        <div class="controls">
					            <input type="text" id="living_area" name="living_area" value="{living_area}">
					        </div><!-- /.controls -->
					    </div><!-- /.control-group -->  
					</div>
					
					<div class="span<?php echo $col_width; ?>">
						 <div class="bedrooms control-group">
					        <label class="control-label" for="lot_size">
					            {@lot_size}
					        </label>
					        <div class="controls">
					            <input type="text" id="lot_size" name="lot_size" value="{lot_size}">
					        </div><!-- /.controls -->
					    </div><!-- /.control-group --> 
					</div>
				</div>
				
				<div class="row">
					<div class="span<?php echo $col_width; ?>">
						<div class="bathrooms control-group">
			                <label class="control-label" for="inputTitle">
			                    {@title}
			                </label>
			                <div class="controls">
			                    <input type="text" name="title" value="{title}" id="inputTitle">
			                </div><!-- /.controls -->
			            </div><!-- /.control-group -->
					</div>
					
					<div class="span<?php echo $col_width; ?>">
						<div class="bathrooms control-group">
			                <label class="control-label" for="inputKeyword">
			                    {@keyword}
			                </label>
			                <div class="controls">
			                    <input type="text" name="keyword" value="{keyword}" id="inputKeyword">
			                </div><!-- /.controls -->
			            </div><!-- /.control-group -->

					</div>
					
					<div class="span<?php echo $col_width; ?>">
						<?php if ( $conf['show_mls'] == 'ON' ) { ?>
				            <div class="bedrooms control-group">
				                <label class="control-label" for="mls">
				                    {@mls}
				                </label>
				                <div class="controls">
				                    <input type="text" id="mls" name="mls" value="{mls}">
				                </div><!-- /.controls -->
				            </div><!-- /.control-group -->
						<?php } ?>
					</div>
				</div>
				
				<div class="row">
					<div class="span<?php echo $col_width; ?>">
						<div class="control-group">
					        <label class="control-label" for="buildings">
					            {@amenities}
					        </label>
					        <div class="controls">
					            <?php
					            
					            $building_list = generate_checkbox_list( BUILDINGS_TABLE, 'buildings', explode( ':', $form['buildings'] ), 1 );
					            foreach ( $building_list AS $data )
					            {
					            	echo '<input type="checkbox" name="buildings[]" value="' . $data['id'] . '">' . $data['name'] . '<br /><br />';
					            }
					            
					            ?>
					        </div><!-- /.controls -->
					    </div><!-- /.control-group -->	
					</div>
					
					<div class="span<?php echo $col_width; ?>">
						<div class="control-group">
					        <label class="control-label" for="appliances">
					            {@appliances}
					        </label>
					        <div class="controls">
								<?php
								
								$list = generate_checkbox_list( APPLIANCES_TABLE, 'appliances', explode( ':', $form['appliances'] ), 1 );
								foreach ( $list AS $id => $data )
					            {
					            	echo '<input type="checkbox" name="appliances[]" value="' . $data['id'] . '">' . $data['name'] . '<br /><br />';
					            }
								
								?>
					        </div><!-- /.controls -->
					    </div><!-- /.control-group -->	
					</div>
					
					<div class="span<?php echo $col_width; ?>">
						<div class="control-group">
					        <label class="control-label" for="features">
					            {@features}
					        </label>
					        <div class="controls">
					            <?php
					            
					            $list = generate_checkbox_list( FEATURES_TABLE, 'features', explode( ':', $form['features'] ), 1 );
					            foreach ( $list AS $id => $data )
					            {
					            	echo '<input type="checkbox" name="features[]" value="' . $data['id'] . '">' . $data['name'] . '<br /><br />';
					            }
					            
					            ?>
					        </div><!-- /.controls -->
					    </div><!-- /.control-group -->
					</div>
				</div>
				
				<div class="row">
					<div class="span<?php echo $col_width; ?>">
						<div class="control-group">
					        <label class="control-label" for="imageUploaded">
					            {@image_uploaded}
					        </label>
					        <div class="controls">
					             <input type="checkbox" id="imageUploaded" name="image_uploaded" value="1">
					        </div><!-- /.controls -->
					    </div><!-- /.control-group -->
					</div>
					
					<div class="span<?php echo $col_width; ?>">
						<?php
						   	
							$query = "SELECT * FROM " . FIELDS_TABLE . " ORDER BY name ASC";
							$result = $db->query($query) OR error( 'Critical Error:' . $query);
							if ( $db->numrows( $result ) > 0 ) 
							{
								while( $row = $db->fetcharray( $result ) )
								{
									$class = ( $class == 'bedrooms' ) ? 'bathrooms' : 'bedrooms';
								
									echo '
								    <div class="' . $class . ' control-group">
								        <label class="control-label" for="' . $row['name'] . '">
								        ' . $row['name'] . '
								        </label>
								        <div class="controls">
									';
				
									// Type of input
									if ($row['type'] != '')
									{
										if ($row['type'] == 'input')
										{
											echo '<input type="text" id="' . $row['field'] . '" name="' . $row['field'] . '" value="">';
										}
										elseif ($row['type'] == 'select')
										{
											// Grab all options for this select
											$options = "SELECT * FROM " . VALUES_TABLE . " WHERE f_id = '" . addslashes($row['id']) . "'";
											$get_options = $db->query($options) OR error( 'Critical Error:' . $options);
											if ($db->numrows($get_options) > 0)
											{								
												echo '
												<select id="' . $row['field'] . '" name="' . $row['field'] . '">
													<option value="">{select}</option>
												';
												
												while($row2 = $db->fetcharray($get_options))
												{
													echo '<option value="' . $row2['id'] . '">' . $row2['name'] . '</option>';
												}
												
												echo '</select>';
											}
										}
									}
								
									echo '
										</div><!-- /.controls -->
									</div><!-- /.control-group -->
									';
								}
							}
						   	
						   	?>
					</div>
				</div>
	
				    <div class="row">
				        <div class="span<?php echo $col_width; ?>">
				        
							<div id="price_range_rent" style="display:none;">								
								<div class="control-group">
					                <label class="control-label">
					                    {@from_price_rental}
					                </label>
					                <div class="controls">
					                    <select name="price_range_rent_min">
					                    	<option value="">{select}</option>
											<?php
											
											$prices = price_ranges( 'rent' );
										
											foreach ( $prices AS $price )
											{
												echo '<option value="' . $price . '">' . $conf['currency'] . ' ' . pmr_number_format( $price ) . '</option>';
											}
											
											?>
					                    </select>
					                </div><!-- /.controls -->
					            </div><!-- /.control-group -->
	
								<div class="control-group">
					                <label class="control-label">
					                    {@to_price_rental}
					                </label>
					                <div class="controls">
					                    <select name="price_range_rent_max">
					                    	<option value="">{select}</option>
											<?php
											
											$prices = price_ranges( 'rent' );
											
											foreach ( $prices AS $price )
											{
												echo '<option value="' . $price . '">' . $conf['currency'] . ' ' . pmr_number_format( $price ) . '</option>';
											}
											
											?>
					                    </select>
					                </div><!-- /.controls -->
					            </div><!-- /.control-group -->
				            </div>
    
				        </div>
	
				    </div><!-- /.row -->
				    
				    <br />
				    
					<div class="form-actions">
						<input type="submit" name="submit" class="btn btn-primary arrow-right" value="{search}">
					</div><!-- /.form-actions -->  
				</div>
					   	
			   	<?php if ( $conf['show_calendar'] == 'ON' ) { ?>
			   		<div class="span3">
			   			<h3>{@calendar}</h3>
			   		
					    <div class="control-group">
					        <div class="controls">
		
							<textarea name="calendar" id="calendar_output" style="display:none;"><?php echo unsafehtml( $form['calendar'] ); ?></textarea>
							<input type="hidden" name="dateTemp" id="dateTemp" value="" />
							<div id="calendar-container"></div>
							
							<script type="text/javascript">
							function dateAvailable(y, m, d) {
								m = (++m < 10) ? "0" + m : m;
								d = (d < 10) ? "0" + d : d;
								return document.getElementById("calendar_output").value.indexOf("" + m + "/" + d + "/" + y + ",");
							}
							
							function toggleDateAvailable(cal) {
								var storage = document.getElementById("calendar_output");
								var d = document.getElementById("dateTemp").value + ",";
								var dateParts = document.getElementById("dateTemp").value.split("/");
								var date = new Date(dateParts[2], dateParts[0] - 1, dateParts[1]);
								var list = storage.value;
								var pos = list.indexOf(d);
							
								if (pos >= 0) {
									if (list.length == 11)
									{
										storage.value = "";
									} else if (pos == 0) {
										storage.value = list.substring(pos + 11);
									} else {
										storage.value = list.substring(0, pos) + list.substring(pos + 11);
									}
								} else {
									storage.value += d;
								}
								
								cal._init(cal.firstDayOfWeek, date);
							}
							
							var today = new Date();
							today.setHours(0, 0, 0 ,0);
							Calendar.setup({
								flat         : "calendar-container", // ID of the parent element
								dateStatusFunc : function(date, y, m, d) {
								if (date < today) {
									return true;
								} else if (dateAvailable(y, m, d) >= 0) {
									return "special";
								}
									return false;
								},
								inputField  : "dateTemp",
								ifFormat    : "%m/%d/%Y",
								weekNumbers : false,
								onUpdate    : function (cal) {
								if (cal.dateClicked) {
									toggleDateAvailable(cal);
								}
								},
									range : new Array('<?php echo date( 'Y' ) . ', ' . ( date( 'Y' ) + 1 ); ?>')
								}
							);
							</script>
					
							<script type="text/javasscript">
							(function($){
								$(document).ready(function () {
									$("#calendarBox").show();
								});
							})(jQuery);
							</script>
							<div id="calendar-legend">
								<p class="calendarAvailable"><span><?php echo $lang['Availability_Calendar_Vacancy']; ?></span></p>
								<p class="calendarUnavailable"><span><?php echo $lang['Availability_Calendar_No_Vacancy']; ?></span></p>
							</div>
			
					        </div><!-- /.controls -->
					    </div><!-- /.control-group -->
					</div>
			    <?php } ?>
			    
				</form>

            </div>
        </div>
    </div>
</div>