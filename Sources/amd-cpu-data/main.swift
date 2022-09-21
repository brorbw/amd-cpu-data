import Cocoa
let serviceObject = IOServiceGetMatchingService(kIOMasterPortDefault,
                                                IOServiceMatching("AMDRyzenCPUPowerManagement"))
if serviceObject == 0 {
    print("Service object is false")
}
var connect: io_connect_t = 0
let status = IOServiceOpen(serviceObject, mach_task_self_, 0, &connect)
var scalerOut: UInt64 = 0
var outputCount: UInt32 = 1
let maxStrLength = 67 //MaxCpu + 3
var outputStr: [Float] = [Float](repeating: 0, count: maxStrLength)
var outputStrCount: Int = 4/*sizeof(float)*/ * maxStrLength
let res = IOConnectCallMethod(connect, 4, nil, 0, nil, 0,
                              &scalerOut, &outputCount,
                              &outputStr, &outputStrCount)
let numberOfCores = Int(scalerOut)
var frequencies : [Float] = []
for i in 0...(numberOfCores-1) {
    frequencies.append(outputStr[Int(i + 3)])
}
let meanFre = Float(frequencies.reduce(0, +) / Float(frequencies.count))
let maxFre = Float(frequencies.max()!)
// let power = res[0]
// let temperature = res[1]
let output: [String: Any] = [
  "power": outputStr[0],
  "temperature": outputStr[1],
  "mean-frequencie": meanFre,
  "max-frequencie": maxFre,
]
let jsonData = try JSONSerialization.data(withJSONObject: output)
if let JSONString = String(data: jsonData, encoding: String.Encoding.utf8) {
   print(JSONString)
}
