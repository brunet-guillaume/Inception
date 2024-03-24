var canvas = document.getElementById('canvas');
var scoreDiv = document.getElementById('score')
var ctx = canvas.getContext('2d');
var direction = '';
var directionQueue = '';
var fps = 60;
var snake = [];
var snakeLength = 20;
var cellSize = 15;
var snakeColor = 'rgba(27, 39, 45)';
var foodColor = 'rgba(239, 246, 224, 0.25)';
var foodX = [];
var foodY = [];
var food = {
	x: 0,
	y: 0
}
var score = 0;
var noMove = 0;
var moveWait = 5;

canvas.setAttribute('tabindex', 1);
canvas.style.outline = 'none';
canvas.focus();

function setFoodXY () {
	foodX = [];
	foodY = [];
	for (i = 0; i <= canvas.width - cellSize; i += cellSize) {
		foodX.push(i);
	}
	for (i = 0; i <= canvas.height - cellSize; i += cellSize) {
		foodY.push(i);
	}
}

function drawSquare(x, y, color) {
	ctx.fillStyle = color;
	ctx.fillRect(x, y, cellSize - 4, cellSize - 4);
}

function checkCollision(x1, y1, x2, y2) {
	if (x1 == x2 && y1 == y2) {
		return true;
	}
	return false;
}

function createFood() {
	food.x = foodX[Math.floor(Math.random() * foodX.length)];
	food.y = foodY[Math.floor(Math.random() * foodY.length)];

	for (i = 0; i < snake.length; i++) {
		if (checkCollision(food.x, food.y, snake[i].x, snake[i].y)) {
			createFood();
		}
	}
}

function drawFood() {
	drawSquare(food.x, food.y, foodColor);
}

function setBackground() {
	var head = snake[0];
	const grd = ctx.createRadialGradient((window.innerWidth * 2 + head.x) / 5, 
		(window.innerHeight * 2 + head.y) / 5, window.innerWidth / 5,
		window.innerWidth / 2, window.innerHeight / 2, window.innerWidth);
	grd.addColorStop(0, '#01161E');
	grd.addColorStop(1, '#000202');

	ctx.fillStyle = grd;
	ctx.fillRect(0, 0, canvas.width, canvas.height);
}

function createSnake() {
	snake = [];

	var x = foodX[Math.floor(Math.random() * foodX.length / 2)]
	var y = foodX[Math.floor(Math.random() * foodY.length / 2)]

	for (i = snakeLength; i > 0; i--) {
		k = i * cellSize;
		snake.push({x: k + x, y: y});
	}
}

function drawSnake() {
	for (i = 0; i < snake.length; i++) {
		drawSquare(snake[i].x, snake[i].y, 'rgba(57, 79, 85, ' + ((snake.length - i) / snake.length + 0.1) + ')');
	}
}

function changeDirection(keycode) {
	if (keycode == 37 && direction != 'r') {
		directionQueue = 'l';
	}
	else if (keycode == 38 && direction != 'd') {
		directionQueue = 'u';
	}
	else if (keycode == 39 && direction != 'l') {
		directionQueue = 'r';
	}
	else if (keycode == 40 && direction != 'u') {
		directionQueue = 'd';
	}
	noMove = 0;
}

function moveSnake() {
	var x = snake[0].x;
	var y = snake[0].y;
	direction = directionQueue;

	if (direction == 'r') {
		if (x > canvas.width - cellSize * 2) {
			x = 0;
		} else {
			x += cellSize;
		}
	}
	else if (direction == 'l') {
		if (x < cellSize) {
			x = (foodX.length - 1) * cellSize;
		} else {
			x -= cellSize;
		}
	}
	else if (direction == 'u') {
		if (y < cellSize) {
			y = (foodY.length - 1) * cellSize;
		} else {
			y -= cellSize;
		}
	}
	else if (direction == 'd') {
		if (y > canvas.height - cellSize * 2) {
			y = 0;
		} else {
			y += cellSize;
		}
	}
	var tail = snake.pop();
	tail.x = x;
	tail.y = y;
	snake.unshift(tail);
}

function game() {
	noMove++;
	var head = snake[0];
	for (i = 1; i < snake.length; i++) {
		if (head.x == snake[i].x && head.y == snake[i].y) {
			setBackground();
			createSnake();
			drawSnake();
			createFood();
			drawFood();
			directionQueue = 'r';
			score = 0;
		}
	}
	if (checkCollision(head.x, head.y, food.x, food.y)) {
		snake[snake.length] = {x: head.x, y: head.y};
		createFood();
		drawFood();
		score += 10;
	}

	canvas.onkeydown = function (e) {
		e = e || window.event;
		moveWait = 50;
		changeDirection(e.keyCode);
	}

	ctx.beginPath();
	setBackground();
	drawSnake();
	drawFood();
	moveSnake();
	if (noMove > moveWait)
	{
		noMove = 0;
		moveWait = Math.floor(Math.random() * 7 + 5)
		next = Math.floor(Math.random() * 4);
		snake[snake.length] = {x: head.x, y: head.y};
		score += 1;
		if (next == 0) {
			changeDirection(37);
		} else if (next == 1) {
			changeDirection(38);
		} else if (next == 2) {
			changeDirection(39);
		} else {
			changeDirection(40);
		}
	}
	scoreDiv.innerHTML = score;
}

function newGame() {
	direction = 'r';
	directionQueue = 'r';
	ctx.beginPath();
	createSnake();
	createFood();
	noMove = 0;

	if (typeof loop != 'undefined') {
		clearInterval(loop);
	} else {
		loop = setInterval(game, fps);
	}
}

function resizeCanvas() {
	canvas.width = window.innerWidth;
	canvas.height = window.innerHeight;
	setFoodXY();
	createFood();
	drawFood();
}

window.addEventListener("resize", resizeCanvas);
resizeCanvas();

newGame();
