.class public Lcom/dropbox/core/v2/files/UploadSessionAppendArg$Builder;
.super Ljava/lang/Object;
.source "UploadSessionAppendArg.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/files/UploadSessionAppendArg;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field protected close:Z

.field protected contentHash:Ljava/lang/String;

.field protected final cursor:Lcom/dropbox/core/v2/files/UploadSessionCursor;


# direct methods
.method protected constructor <init>(Lcom/dropbox/core/v2/files/UploadSessionCursor;)V
    .locals 1

    .line 144
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_0

    .line 148
    iput-object p1, p0, Lcom/dropbox/core/v2/files/UploadSessionAppendArg$Builder;->cursor:Lcom/dropbox/core/v2/files/UploadSessionCursor;

    const/4 p1, 0x0

    .line 149
    iput-boolean p1, p0, Lcom/dropbox/core/v2/files/UploadSessionAppendArg$Builder;->close:Z

    const/4 p1, 0x0

    .line 150
    iput-object p1, p0, Lcom/dropbox/core/v2/files/UploadSessionAppendArg$Builder;->contentHash:Ljava/lang/String;

    return-void

    .line 146
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Required value for \'cursor\' is null"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public build()Lcom/dropbox/core/v2/files/UploadSessionAppendArg;
    .locals 4

    .line 212
    new-instance v0, Lcom/dropbox/core/v2/files/UploadSessionAppendArg;

    iget-object v1, p0, Lcom/dropbox/core/v2/files/UploadSessionAppendArg$Builder;->cursor:Lcom/dropbox/core/v2/files/UploadSessionCursor;

    iget-boolean v2, p0, Lcom/dropbox/core/v2/files/UploadSessionAppendArg$Builder;->close:Z

    iget-object v3, p0, Lcom/dropbox/core/v2/files/UploadSessionAppendArg$Builder;->contentHash:Ljava/lang/String;

    invoke-direct {v0, v1, v2, v3}, Lcom/dropbox/core/v2/files/UploadSessionAppendArg;-><init>(Lcom/dropbox/core/v2/files/UploadSessionCursor;ZLjava/lang/String;)V

    return-object v0
.end method

.method public withClose(Ljava/lang/Boolean;)Lcom/dropbox/core/v2/files/UploadSessionAppendArg$Builder;
    .locals 0

    if-eqz p1, :cond_0

    .line 169
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    iput-boolean p1, p0, Lcom/dropbox/core/v2/files/UploadSessionAppendArg$Builder;->close:Z

    return-object p0

    :cond_0
    const/4 p1, 0x0

    .line 172
    iput-boolean p1, p0, Lcom/dropbox/core/v2/files/UploadSessionAppendArg$Builder;->close:Z

    return-object p0
.end method

.method public withContentHash(Ljava/lang/String;)Lcom/dropbox/core/v2/files/UploadSessionAppendArg$Builder;
    .locals 2

    if-eqz p1, :cond_2

    .line 194
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0x40

    if-lt v0, v1, :cond_1

    .line 197
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-gt v0, v1, :cond_0

    goto :goto_0

    .line 198
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "String \'contentHash\' is longer than 64"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 195
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "String \'contentHash\' is shorter than 64"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 201
    :cond_2
    :goto_0
    iput-object p1, p0, Lcom/dropbox/core/v2/files/UploadSessionAppendArg$Builder;->contentHash:Ljava/lang/String;

    return-object p0
.end method
