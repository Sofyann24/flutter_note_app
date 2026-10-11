<?php

use App\Http\Controllers\Api\CategoryController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

Route::get('/user', function (Request $request) {
    return $request->user();
})->middleware('auth:sanctum');


// ROUTES CATEGORIES
Route::get('category', [CategoryController::class, 'index']);
Route::post('category/store', [CategoryController::class, 'store']);
