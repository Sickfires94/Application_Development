import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:timeago/timeago.dart' as timeago;


class JobList extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _JobListState();
}

class Job{
  final String title;
  final String CompanyName;
  final String CompanyLogoURL;
  final String Location;
  final String JobType;
  final String WorkplaceType;
  final String TimePosted;

  Job ({
    required this.title,
    required this.CompanyName,
    required this.CompanyLogoURL,
    required this.Location,
    required this.JobType,
    required this.WorkplaceType,
    required this.TimePosted,
});

  factory Job.fromJson(Map<String, dynamic> json) {
    return Job(
      title: json['title'],
      CompanyName: json['company']['name'],
      CompanyLogoURL: json['company']['logo'],
      Location: json['location']['name_en'],
      JobType: json['type']['name_en'],
      WorkplaceType: json['workplace_type']['name_en'],
      TimePosted: timeago.format(DateTime.parse(json['updated_date'])),
    );
  }
}

class _JobListState extends State<JobList>{
  Future<List<Job>> fetchAllJobs() async{
    final response = await http.get(Uri.parse("https://mpa0771a40ef48fcdfb7.free.beeceptor.com/jobs"));
    if(response.statusCode == 200){
      final data = jsonDecode(response.body);
      List<Job> jobs = (data['data'] as List).map((job) {
        return Job.fromJson(job['job']);
      }).toList();
      return jobs;
    }
    else throw Exception("Failed to load posts");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: FutureBuilder(future: fetchAllJobs(), builder: (context, snap){
          if (snap.hasData){
            return ListView.builder(
                itemCount: snap.data?.length,
                itemBuilder: (c, index){

              var job = snap.data![index];
              // return ListTile(
              //   title: Text(job.title),
              //   subtitle: Text(job.CompanyName + "\n" + job.Location + ", " + job.WorkplaceType + ", " + job.JobType),
              //   trailing: Text(job.TimePosted),
              //   leading: CircleAvatar(child: Image.network(job.CompanyLogoURL),),
              // );

                  return  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.white10, width: 2), // Add border color and width
                      borderRadius: BorderRadius.circular(15), // Rounded corners
                    ),
                    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16), // Add margin to space between tiles
                    child: ListTile(
                      title: Text(job.title),
                      subtitle: Text(job.CompanyName + "\n" + job.Location + ", " + job.WorkplaceType + ", " + job.JobType),
                      leading: CircleAvatar(child: Image.network(job.CompanyLogoURL)),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.end, // Position the time at the bottom
                        crossAxisAlignment: CrossAxisAlignment.end, // Align the time to the right
                        children: [
                          Text(job.TimePosted), // Your time_posted text
                        ],
                      ),
                    ),
                  );
            });
          }
          return Center(child: Text("Loading"),);
        })
      )
    );
  }
}

