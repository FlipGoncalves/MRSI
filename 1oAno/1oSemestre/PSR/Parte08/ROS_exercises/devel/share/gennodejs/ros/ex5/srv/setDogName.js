// Auto-generated. Do not edit!

// (in-package ex5.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class setDogNameRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.new_name = null;
    }
    else {
      if (initObj.hasOwnProperty('new_name')) {
        this.new_name = initObj.new_name
      }
      else {
        this.new_name = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type setDogNameRequest
    // Serialize message field [new_name]
    bufferOffset = _serializer.string(obj.new_name, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type setDogNameRequest
    let len;
    let data = new setDogNameRequest(null);
    // Deserialize message field [new_name]
    data.new_name = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.new_name.length;
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'ex5/setDogNameRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '52e230bdbf0c4867124039d0a6991c49';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string new_name
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new setDogNameRequest(null);
    if (msg.new_name !== undefined) {
      resolved.new_name = msg.new_name;
    }
    else {
      resolved.new_name = ''
    }

    return resolved;
    }
};

class setDogNameResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.result = null;
    }
    else {
      if (initObj.hasOwnProperty('result')) {
        this.result = initObj.result
      }
      else {
        this.result = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type setDogNameResponse
    // Serialize message field [result]
    bufferOffset = _serializer.bool(obj.result, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type setDogNameResponse
    let len;
    let data = new setDogNameResponse(null);
    // Deserialize message field [result]
    data.result = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'ex5/setDogNameResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'eb13ac1f1354ccecb7941ee8fa2192e8';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool result
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new setDogNameResponse(null);
    if (msg.result !== undefined) {
      resolved.result = msg.result;
    }
    else {
      resolved.result = false
    }

    return resolved;
    }
};

module.exports = {
  Request: setDogNameRequest,
  Response: setDogNameResponse,
  md5sum() { return 'ef27681b79a917a66e27f7b1af5214cd'; },
  datatype() { return 'ex5/setDogName'; }
};
