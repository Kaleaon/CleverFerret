.class public Lcom/dropbox/core/v2/files/MinimalFileLinkMetadata$Builder;
.super Ljava/lang/Object;
.source "MinimalFileLinkMetadata.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/files/MinimalFileLinkMetadata;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field protected id:Ljava/lang/String;

.field protected path:Ljava/lang/String;

.field protected final rev:Ljava/lang/String;

.field protected final url:Ljava/lang/String;


# direct methods
.method protected constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 167
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_3

    .line 171
    iput-object p1, p0, Lcom/dropbox/core/v2/files/MinimalFileLinkMetadata$Builder;->url:Ljava/lang/String;

    if-eqz p2, :cond_2

    .line 175
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result p1

    const/16 v0, 0x9

    if-lt p1, v0, :cond_1

    .line 178
    const-string p1, "[0-9a-f]+"

    invoke-static {p1, p2}, Ljava/util/regex/Pattern;->matches(Ljava/lang/String;Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 181
    iput-object p2, p0, Lcom/dropbox/core/v2/files/MinimalFileLinkMetadata$Builder;->rev:Ljava/lang/String;

    const/4 p1, 0x0

    .line 182
    iput-object p1, p0, Lcom/dropbox/core/v2/files/MinimalFileLinkMetadata$Builder;->id:Ljava/lang/String;

    .line 183
    iput-object p1, p0, Lcom/dropbox/core/v2/files/MinimalFileLinkMetadata$Builder;->path:Ljava/lang/String;

    return-void

    .line 179
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "String \'rev\' does not match pattern"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 176
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "String \'rev\' is shorter than 9"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 173
    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'rev\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 169
    :cond_3
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'url\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public build()Lcom/dropbox/core/v2/files/MinimalFileLinkMetadata;
    .locals 5

    .line 228
    new-instance v0, Lcom/dropbox/core/v2/files/MinimalFileLinkMetadata;

    iget-object v1, p0, Lcom/dropbox/core/v2/files/MinimalFileLinkMetadata$Builder;->url:Ljava/lang/String;

    iget-object v2, p0, Lcom/dropbox/core/v2/files/MinimalFileLinkMetadata$Builder;->rev:Ljava/lang/String;

    iget-object v3, p0, Lcom/dropbox/core/v2/files/MinimalFileLinkMetadata$Builder;->id:Ljava/lang/String;

    iget-object v4, p0, Lcom/dropbox/core/v2/files/MinimalFileLinkMetadata$Builder;->path:Ljava/lang/String;

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/dropbox/core/v2/files/MinimalFileLinkMetadata;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method public withId(Ljava/lang/String;)Lcom/dropbox/core/v2/files/MinimalFileLinkMetadata$Builder;
    .locals 2

    if-eqz p1, :cond_1

    .line 199
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x1

    if-lt v0, v1, :cond_0

    goto :goto_0

    .line 200
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "String \'id\' is shorter than 1"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 203
    :cond_1
    :goto_0
    iput-object p1, p0, Lcom/dropbox/core/v2/files/MinimalFileLinkMetadata$Builder;->id:Ljava/lang/String;

    return-object p0
.end method

.method public withPath(Ljava/lang/String;)Lcom/dropbox/core/v2/files/MinimalFileLinkMetadata$Builder;
    .locals 0

    .line 217
    iput-object p1, p0, Lcom/dropbox/core/v2/files/MinimalFileLinkMetadata$Builder;->path:Ljava/lang/String;

    return-object p0
.end method
