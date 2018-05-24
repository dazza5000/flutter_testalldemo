class Reply{
   int id;
   String image ;
   int user;
   String username ;
   String mesg ;
   int review ;
   int doctorId ;
   String doctor ;
   int articleId ;
   String article ;
   int comment ;
   int mention ;
   String mentionName ;
   bool canDelete ;
   var createDate ;
   var timeAgo;

   Reply(this.id, this.image, this.user, this.username, this.mesg, this.review,
       this.doctorId, this.doctor, this.articleId, this.article, this.comment,
       this.mention, this.mentionName, this.canDelete, this.createDate,
       this.timeAgo);


}