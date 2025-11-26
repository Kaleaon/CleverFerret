.class public Lcom/dropbox/core/v2/teamlog/FileRequestDeadline$Builder;
.super Ljava/lang/Object;
.source "FileRequestDeadline.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/teamlog/FileRequestDeadline;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field protected allowLateUploads:Ljava/lang/String;

.field protected deadline:Ljava/util/Date;


# direct methods
.method protected constructor <init>()V
    .locals 1

    .line 98
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 99
    iput-object v0, p0, Lcom/dropbox/core/v2/teamlog/FileRequestDeadline$Builder;->deadline:Ljava/util/Date;

    .line 100
    iput-object v0, p0, Lcom/dropbox/core/v2/teamlog/FileRequestDeadline$Builder;->allowLateUploads:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public build()Lcom/dropbox/core/v2/teamlog/FileRequestDeadline;
    .locals 3

    .line 136
    new-instance v0, Lcom/dropbox/core/v2/teamlog/FileRequestDeadline;

    iget-object v1, p0, Lcom/dropbox/core/v2/teamlog/FileRequestDeadline$Builder;->deadline:Ljava/util/Date;

    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/FileRequestDeadline$Builder;->allowLateUploads:Ljava/lang/String;

    invoke-direct {v0, v1, v2}, Lcom/dropbox/core/v2/teamlog/FileRequestDeadline;-><init>(Ljava/util/Date;Ljava/lang/String;)V

    return-object v0
.end method

.method public withAllowLateUploads(Ljava/lang/String;)Lcom/dropbox/core/v2/teamlog/FileRequestDeadline$Builder;
    .locals 0

    .line 125
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/FileRequestDeadline$Builder;->allowLateUploads:Ljava/lang/String;

    return-object p0
.end method

.method public withDeadline(Ljava/util/Date;)Lcom/dropbox/core/v2/teamlog/FileRequestDeadline$Builder;
    .locals 0

    .line 112
    invoke-static {p1}, Lcom/dropbox/core/util/LangUtil;->truncateMillis(Ljava/util/Date;)Ljava/util/Date;

    move-result-object p1

    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/FileRequestDeadline$Builder;->deadline:Ljava/util/Date;

    return-object p0
.end method
