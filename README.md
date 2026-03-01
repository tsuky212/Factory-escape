# Factory-escape
Dive into an unforgettable adventure where you transform into a mysterious blue turtle on a mission to collect hidden treasure! 🐢💙

extends Node

var score = 0
@onready var scorelabeled: Label = $scorelabeled

func add_point():
	score += 1
	scorelabeled.text = 'You collected' + str(score) + "$."

extends Area2D

@onready var timer: Timer = $Timer


func _on_body_entered(body: Node2D) -> void:
	print('You died!')
	Engine.time_scale = 0.5
	body.get_node('CollisonShape2D')
	timer.start()

  extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
  func _process(delta: float) -> void:
	if ray_cast_2_dright.is_colliding():
		direction = -1
		animated_sprite.flip_h = true
	if ray_cast_2d_2_left.is_colliding():
		direction= 1
		animated_sprite.flip_h = false 
	position.x += direction * SPEED * delta
extends CharacterBody2D


const SPEED = 130.0
const JUMP_VELOCITY = -300.0
@onready var animated_sprite_2d_2: AnimatedSprite2D = $AnimatedSprite2D2


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("move_left", "move_right" )
	
	if direction> 0:
		animated_sprite_2d_2.flip_h = false
	elif direction < 0:
		animated_sprite_2d_2.flip_h = true
	if is_on_floor():
		if direction == 0 :
			animated_sprite_2d_2.play("idle")
		else:
			animated_sprite_2d_2.play('run')
	else:
		animated_sprite_2d_2.play('jump')
	
	  
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

