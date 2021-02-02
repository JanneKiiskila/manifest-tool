#!/usr/bin/env bash -e
# ----------------------------------------------------------------------------
# Copyright 2019-2021 Pelion
#
# SPDX-License-Identifier: Apache-2.0
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
# ----------------------------------------------------------------------------

generate() {
    local input=$1
    local output=$2
    echo "asn1ate $input > $output"
    echo "# ----------------------------------------------------------------------------" > $output
    cat ../../../LICENSE | sed 's/^/# /' >> $output
    echo "# ----------------------------------------------------------------------------" >> $output
    asn1ate $input >> $output
}

generate v3/manifest_v3.asn v3/manifest_schema_v3.py
generate v1/manifest-1.0.0 v1/manifest_schema_v1.py