.class public Lorg/apache/commons/vfs2/operations/vcs/VcsLogEntry;
.super Ljava/lang/Object;
.source "VcsLogEntry.java"


# instance fields
.field private final author:Ljava/lang/String;

.field private final date:Ljava/util/Calendar;

.field private final message:Ljava/lang/String;

.field private final path:Ljava/lang/String;

.field private final revision:J


# direct methods
.method public constructor <init>(Ljava/lang/String;JLjava/lang/String;Ljava/util/Calendar;Ljava/lang/String;)V
    .locals 0

    .line 59
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 60
    iput-object p1, p0, Lorg/apache/commons/vfs2/operations/vcs/VcsLogEntry;->author:Ljava/lang/String;

    .line 61
    iput-wide p2, p0, Lorg/apache/commons/vfs2/operations/vcs/VcsLogEntry;->revision:J

    .line 62
    iput-object p4, p0, Lorg/apache/commons/vfs2/operations/vcs/VcsLogEntry;->message:Ljava/lang/String;

    .line 63
    iput-object p5, p0, Lorg/apache/commons/vfs2/operations/vcs/VcsLogEntry;->date:Ljava/util/Calendar;

    .line 64
    iput-object p6, p0, Lorg/apache/commons/vfs2/operations/vcs/VcsLogEntry;->path:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public getAuthor()Ljava/lang/String;
    .locals 1

    .line 72
    iget-object v0, p0, Lorg/apache/commons/vfs2/operations/vcs/VcsLogEntry;->author:Ljava/lang/String;

    return-object v0
.end method

.method public getDate()Ljava/util/Calendar;
    .locals 1

    .line 96
    iget-object v0, p0, Lorg/apache/commons/vfs2/operations/vcs/VcsLogEntry;->date:Ljava/util/Calendar;

    return-object v0
.end method

.method public getMessage()Ljava/lang/String;
    .locals 1

    .line 88
    iget-object v0, p0, Lorg/apache/commons/vfs2/operations/vcs/VcsLogEntry;->message:Ljava/lang/String;

    return-object v0
.end method

.method public getPath()Ljava/lang/String;
    .locals 1

    .line 104
    iget-object v0, p0, Lorg/apache/commons/vfs2/operations/vcs/VcsLogEntry;->path:Ljava/lang/String;

    return-object v0
.end method

.method public getRevision()J
    .locals 2

    .line 80
    iget-wide v0, p0, Lorg/apache/commons/vfs2/operations/vcs/VcsLogEntry;->revision:J

    return-wide v0
.end method
