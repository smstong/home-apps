<!doctype html>
<html>
	<head>
			<link rel="stylesheet" href="./index.css">
			<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
			<title>老赵家播放系统</title>
	</head>
	<body>
			<iframe style="display:none;" name="transFrame" id="transFrame"></iframe>
			<table>
					<tr>
						<td>
							<form action="/cgi-bin/player.sh" target="transFrame">
									<input type="submit" id="stop" name="action" value="stop" />
							</form>
						</td>
					</tr>
					<tr>
						<td>
							<form action="/cgi-bin/player.sh" target="transFrame">
									<input type="submit" id="pause" name="action" value="pause" />
							</form>
						</td>
					</tr>
					<tr>
						<td>
							<form action="/cgi-bin/player.sh" target="transFrame">
									<input type="submit" id="resume" name="action" value="resume" />
							</form>
						</td>
					</tr>
                    PLAYLIST_ROWS
			</table>
	</body>

</html>
