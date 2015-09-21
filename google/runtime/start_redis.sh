#!/bin/bash
#
# Copyright 2015 Google Inc. All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

REDIS_PORT=${REDIS_PORT:-6379}

if nc -z localhost $REDIS_PORT; then
    echo "Redis is already up."
    exit 0
fi

echo "Starting Redis..."
sudo service redis-server start
echo "Waiting for Redis to start accepting requests on $REDIS_PORT..."
while ! nc -z localhost $REDIS_PORT; do sleep 0.1; done; echo "Redis is up."