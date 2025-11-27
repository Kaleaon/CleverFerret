.class public Lcom/google/api/services/drive/Drive$Drives;
.super Ljava/lang/Object;
.source "Drive.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/api/services/drive/Drive;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "Drives"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/api/services/drive/Drive$Drives$Update;,
        Lcom/google/api/services/drive/Drive$Drives$Unhide;,
        Lcom/google/api/services/drive/Drive$Drives$List;,
        Lcom/google/api/services/drive/Drive$Drives$Hide;,
        Lcom/google/api/services/drive/Drive$Drives$Get;,
        Lcom/google/api/services/drive/Drive$Drives$Delete;,
        Lcom/google/api/services/drive/Drive$Drives$Create;
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/api/services/drive/Drive;


# direct methods
.method public constructor <init>(Lcom/google/api/services/drive/Drive;)V
    .locals 0

    .line 2440
    iput-object p1, p0, Lcom/google/api/services/drive/Drive$Drives;->this$0:Lcom/google/api/services/drive/Drive;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public create(Ljava/lang/String;Lcom/google/api/services/drive/model/Drive;)Lcom/google/api/services/drive/Drive$Drives$Create;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 2458
    new-instance v0, Lcom/google/api/services/drive/Drive$Drives$Create;

    invoke-direct {v0, p0, p1, p2}, Lcom/google/api/services/drive/Drive$Drives$Create;-><init>(Lcom/google/api/services/drive/Drive$Drives;Ljava/lang/String;Lcom/google/api/services/drive/model/Drive;)V

    .line 2459
    iget-object p1, p0, Lcom/google/api/services/drive/Drive$Drives;->this$0:Lcom/google/api/services/drive/Drive;

    invoke-virtual {p1, v0}, Lcom/google/api/services/drive/Drive;->initialize(Lcom/google/api/client/googleapis/services/AbstractGoogleClientRequest;)V

    return-object v0
.end method

.method public delete(Ljava/lang/String;)Lcom/google/api/services/drive/Drive$Drives$Delete;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 2571
    new-instance v0, Lcom/google/api/services/drive/Drive$Drives$Delete;

    invoke-direct {v0, p0, p1}, Lcom/google/api/services/drive/Drive$Drives$Delete;-><init>(Lcom/google/api/services/drive/Drive$Drives;Ljava/lang/String;)V

    .line 2572
    iget-object p1, p0, Lcom/google/api/services/drive/Drive$Drives;->this$0:Lcom/google/api/services/drive/Drive;

    invoke-virtual {p1, v0}, Lcom/google/api/services/drive/Drive;->initialize(Lcom/google/api/client/googleapis/services/AbstractGoogleClientRequest;)V

    return-object v0
.end method

.method public get(Ljava/lang/String;)Lcom/google/api/services/drive/Drive$Drives$Get;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 2667
    new-instance v0, Lcom/google/api/services/drive/Drive$Drives$Get;

    invoke-direct {v0, p0, p1}, Lcom/google/api/services/drive/Drive$Drives$Get;-><init>(Lcom/google/api/services/drive/Drive$Drives;Ljava/lang/String;)V

    .line 2668
    iget-object p1, p0, Lcom/google/api/services/drive/Drive$Drives;->this$0:Lcom/google/api/services/drive/Drive;

    invoke-virtual {p1, v0}, Lcom/google/api/services/drive/Drive;->initialize(Lcom/google/api/client/googleapis/services/AbstractGoogleClientRequest;)V

    return-object v0
.end method

.method public hide(Ljava/lang/String;)Lcom/google/api/services/drive/Drive$Drives$Hide;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 2826
    new-instance v0, Lcom/google/api/services/drive/Drive$Drives$Hide;

    invoke-direct {v0, p0, p1}, Lcom/google/api/services/drive/Drive$Drives$Hide;-><init>(Lcom/google/api/services/drive/Drive$Drives;Ljava/lang/String;)V

    .line 2827
    iget-object p1, p0, Lcom/google/api/services/drive/Drive$Drives;->this$0:Lcom/google/api/services/drive/Drive;

    invoke-virtual {p1, v0}, Lcom/google/api/services/drive/Drive;->initialize(Lcom/google/api/client/googleapis/services/AbstractGoogleClientRequest;)V

    return-object v0
.end method

.method public list()Lcom/google/api/services/drive/Drive$Drives$List;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 2920
    new-instance v0, Lcom/google/api/services/drive/Drive$Drives$List;

    invoke-direct {v0, p0}, Lcom/google/api/services/drive/Drive$Drives$List;-><init>(Lcom/google/api/services/drive/Drive$Drives;)V

    .line 2921
    iget-object v1, p0, Lcom/google/api/services/drive/Drive$Drives;->this$0:Lcom/google/api/services/drive/Drive;

    invoke-virtual {v1, v0}, Lcom/google/api/services/drive/Drive;->initialize(Lcom/google/api/client/googleapis/services/AbstractGoogleClientRequest;)V

    return-object v0
.end method

.method public unhide(Ljava/lang/String;)Lcom/google/api/services/drive/Drive$Drives$Unhide;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 3106
    new-instance v0, Lcom/google/api/services/drive/Drive$Drives$Unhide;

    invoke-direct {v0, p0, p1}, Lcom/google/api/services/drive/Drive$Drives$Unhide;-><init>(Lcom/google/api/services/drive/Drive$Drives;Ljava/lang/String;)V

    .line 3107
    iget-object p1, p0, Lcom/google/api/services/drive/Drive$Drives;->this$0:Lcom/google/api/services/drive/Drive;

    invoke-virtual {p1, v0}, Lcom/google/api/services/drive/Drive;->initialize(Lcom/google/api/client/googleapis/services/AbstractGoogleClientRequest;)V

    return-object v0
.end method

.method public update(Ljava/lang/String;Lcom/google/api/services/drive/model/Drive;)Lcom/google/api/services/drive/Drive$Drives$Update;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 3202
    new-instance v0, Lcom/google/api/services/drive/Drive$Drives$Update;

    invoke-direct {v0, p0, p1, p2}, Lcom/google/api/services/drive/Drive$Drives$Update;-><init>(Lcom/google/api/services/drive/Drive$Drives;Ljava/lang/String;Lcom/google/api/services/drive/model/Drive;)V

    .line 3203
    iget-object p1, p0, Lcom/google/api/services/drive/Drive$Drives;->this$0:Lcom/google/api/services/drive/Drive;

    invoke-virtual {p1, v0}, Lcom/google/api/services/drive/Drive;->initialize(Lcom/google/api/client/googleapis/services/AbstractGoogleClientRequest;)V

    return-object v0
.end method
