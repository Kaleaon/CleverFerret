.class public Lcom/dropbox/core/v2/files/UploadSessionStartArg$Builder;
.super Ljava/lang/Object;
.source "UploadSessionStartArg.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/files/UploadSessionStartArg;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field protected close:Z

.field protected contentHash:Ljava/lang/String;

.field protected sessionType:Lcom/dropbox/core/v2/files/UploadSessionType;


# direct methods
.method protected constructor <init>()V
    .locals 1

    .line 130
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 131
    iput-boolean v0, p0, Lcom/dropbox/core/v2/files/UploadSessionStartArg$Builder;->close:Z

    const/4 v0, 0x0

    .line 132
    iput-object v0, p0, Lcom/dropbox/core/v2/files/UploadSessionStartArg$Builder;->sessionType:Lcom/dropbox/core/v2/files/UploadSessionType;

    .line 133
    iput-object v0, p0, Lcom/dropbox/core/v2/files/UploadSessionStartArg$Builder;->contentHash:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public build()Lcom/dropbox/core/v2/files/UploadSessionStartArg;
    .locals 4

    .line 208
    new-instance v0, Lcom/dropbox/core/v2/files/UploadSessionStartArg;

    iget-boolean v1, p0, Lcom/dropbox/core/v2/files/UploadSessionStartArg$Builder;->close:Z

    iget-object v2, p0, Lcom/dropbox/core/v2/files/UploadSessionStartArg$Builder;->sessionType:Lcom/dropbox/core/v2/files/UploadSessionType;

    iget-object v3, p0, Lcom/dropbox/core/v2/files/UploadSessionStartArg$Builder;->contentHash:Ljava/lang/String;

    invoke-direct {v0, v1, v2, v3}, Lcom/dropbox/core/v2/files/UploadSessionStartArg;-><init>(ZLcom/dropbox/core/v2/files/UploadSessionType;Ljava/lang/String;)V

    return-object v0
.end method

.method public withClose(Ljava/lang/Boolean;)Lcom/dropbox/core/v2/files/UploadSessionStartArg$Builder;
    .locals 0

    if-eqz p1, :cond_0

    .line 152
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    iput-boolean p1, p0, Lcom/dropbox/core/v2/files/UploadSessionStartArg$Builder;->close:Z

    return-object p0

    :cond_0
    const/4 p1, 0x0

    .line 155
    iput-boolean p1, p0, Lcom/dropbox/core/v2/files/UploadSessionStartArg$Builder;->close:Z

    return-object p0
.end method

.method public withContentHash(Ljava/lang/String;)Lcom/dropbox/core/v2/files/UploadSessionStartArg$Builder;
    .locals 2

    if-eqz p1, :cond_2

    .line 190
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0x40

    if-lt v0, v1, :cond_1

    .line 193
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-gt v0, v1, :cond_0

    goto :goto_0

    .line 194
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "String \'contentHash\' is longer than 64"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 191
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "String \'contentHash\' is shorter than 64"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 197
    :cond_2
    :goto_0
    iput-object p1, p0, Lcom/dropbox/core/v2/files/UploadSessionStartArg$Builder;->contentHash:Ljava/lang/String;

    return-object p0
.end method

.method public withSessionType(Lcom/dropbox/core/v2/files/UploadSessionType;)Lcom/dropbox/core/v2/files/UploadSessionStartArg$Builder;
    .locals 0

    .line 169
    iput-object p1, p0, Lcom/dropbox/core/v2/files/UploadSessionStartArg$Builder;->sessionType:Lcom/dropbox/core/v2/files/UploadSessionType;

    return-object p0
.end method
