.class public Lcom/dropbox/core/v2/files/CommitInfo$Builder;
.super Ljava/lang/Object;
.source "CommitInfo.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/files/CommitInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field protected autorename:Z

.field protected clientModified:Ljava/util/Date;

.field protected mode:Lcom/dropbox/core/v2/files/WriteMode;

.field protected mute:Z

.field protected final path:Ljava/lang/String;

.field protected propertyGroups:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/dropbox/core/v2/fileproperties/PropertyGroup;",
            ">;"
        }
    .end annotation
.end field

.field protected strictConflict:Z


# direct methods
.method protected constructor <init>(Ljava/lang/String;)V
    .locals 1

    .line 231
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_1

    .line 235
    const-string v0, "(/(.|[\\r\\n])*)|(ns:[0-9]+(/.*)?)|(id:.*)"

    invoke-static {v0, p1}, Ljava/util/regex/Pattern;->matches(Ljava/lang/String;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 238
    iput-object p1, p0, Lcom/dropbox/core/v2/files/CommitInfo$Builder;->path:Ljava/lang/String;

    .line 239
    sget-object p1, Lcom/dropbox/core/v2/files/WriteMode;->ADD:Lcom/dropbox/core/v2/files/WriteMode;

    iput-object p1, p0, Lcom/dropbox/core/v2/files/CommitInfo$Builder;->mode:Lcom/dropbox/core/v2/files/WriteMode;

    const/4 p1, 0x0

    .line 240
    iput-boolean p1, p0, Lcom/dropbox/core/v2/files/CommitInfo$Builder;->autorename:Z

    const/4 v0, 0x0

    .line 241
    iput-object v0, p0, Lcom/dropbox/core/v2/files/CommitInfo$Builder;->clientModified:Ljava/util/Date;

    .line 242
    iput-boolean p1, p0, Lcom/dropbox/core/v2/files/CommitInfo$Builder;->mute:Z

    .line 243
    iput-object v0, p0, Lcom/dropbox/core/v2/files/CommitInfo$Builder;->propertyGroups:Ljava/util/List;

    .line 244
    iput-boolean p1, p0, Lcom/dropbox/core/v2/files/CommitInfo$Builder;->strictConflict:Z

    return-void

    .line 236
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "String \'path\' does not match pattern"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 233
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Required value for \'path\' is null"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public build()Lcom/dropbox/core/v2/files/CommitInfo;
    .locals 8

    .line 393
    new-instance v0, Lcom/dropbox/core/v2/files/CommitInfo;

    iget-object v1, p0, Lcom/dropbox/core/v2/files/CommitInfo$Builder;->path:Ljava/lang/String;

    iget-object v2, p0, Lcom/dropbox/core/v2/files/CommitInfo$Builder;->mode:Lcom/dropbox/core/v2/files/WriteMode;

    iget-boolean v3, p0, Lcom/dropbox/core/v2/files/CommitInfo$Builder;->autorename:Z

    iget-object v4, p0, Lcom/dropbox/core/v2/files/CommitInfo$Builder;->clientModified:Ljava/util/Date;

    iget-boolean v5, p0, Lcom/dropbox/core/v2/files/CommitInfo$Builder;->mute:Z

    iget-object v6, p0, Lcom/dropbox/core/v2/files/CommitInfo$Builder;->propertyGroups:Ljava/util/List;

    iget-boolean v7, p0, Lcom/dropbox/core/v2/files/CommitInfo$Builder;->strictConflict:Z

    invoke-direct/range {v0 .. v7}, Lcom/dropbox/core/v2/files/CommitInfo;-><init>(Ljava/lang/String;Lcom/dropbox/core/v2/files/WriteMode;ZLjava/util/Date;ZLjava/util/List;Z)V

    return-object v0
.end method

.method public withAutorename(Ljava/lang/Boolean;)Lcom/dropbox/core/v2/files/CommitInfo$Builder;
    .locals 0

    if-eqz p1, :cond_0

    .line 287
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    iput-boolean p1, p0, Lcom/dropbox/core/v2/files/CommitInfo$Builder;->autorename:Z

    return-object p0

    :cond_0
    const/4 p1, 0x0

    .line 290
    iput-boolean p1, p0, Lcom/dropbox/core/v2/files/CommitInfo$Builder;->autorename:Z

    return-object p0
.end method

.method public withClientModified(Ljava/util/Date;)Lcom/dropbox/core/v2/files/CommitInfo$Builder;
    .locals 0

    .line 308
    invoke-static {p1}, Lcom/dropbox/core/util/LangUtil;->truncateMillis(Ljava/util/Date;)Ljava/util/Date;

    move-result-object p1

    iput-object p1, p0, Lcom/dropbox/core/v2/files/CommitInfo$Builder;->clientModified:Ljava/util/Date;

    return-object p0
.end method

.method public withMode(Lcom/dropbox/core/v2/files/WriteMode;)Lcom/dropbox/core/v2/files/CommitInfo$Builder;
    .locals 0

    if-eqz p1, :cond_0

    .line 264
    iput-object p1, p0, Lcom/dropbox/core/v2/files/CommitInfo$Builder;->mode:Lcom/dropbox/core/v2/files/WriteMode;

    return-object p0

    .line 267
    :cond_0
    sget-object p1, Lcom/dropbox/core/v2/files/WriteMode;->ADD:Lcom/dropbox/core/v2/files/WriteMode;

    iput-object p1, p0, Lcom/dropbox/core/v2/files/CommitInfo$Builder;->mode:Lcom/dropbox/core/v2/files/WriteMode;

    return-object p0
.end method

.method public withMute(Ljava/lang/Boolean;)Lcom/dropbox/core/v2/files/CommitInfo$Builder;
    .locals 0

    if-eqz p1, :cond_0

    .line 328
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    iput-boolean p1, p0, Lcom/dropbox/core/v2/files/CommitInfo$Builder;->mute:Z

    return-object p0

    :cond_0
    const/4 p1, 0x0

    .line 331
    iput-boolean p1, p0, Lcom/dropbox/core/v2/files/CommitInfo$Builder;->mute:Z

    return-object p0
.end method

.method public withPropertyGroups(Ljava/util/List;)Lcom/dropbox/core/v2/files/CommitInfo$Builder;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/dropbox/core/v2/fileproperties/PropertyGroup;",
            ">;)",
            "Lcom/dropbox/core/v2/files/CommitInfo$Builder;"
        }
    .end annotation

    if-eqz p1, :cond_1

    .line 349
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/dropbox/core/v2/fileproperties/PropertyGroup;

    if-eqz v1, :cond_0

    goto :goto_0

    .line 351
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "An item in list \'propertyGroups\' is null"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 355
    :cond_1
    iput-object p1, p0, Lcom/dropbox/core/v2/files/CommitInfo$Builder;->propertyGroups:Ljava/util/List;

    return-object p0
.end method

.method public withStrictConflict(Ljava/lang/Boolean;)Lcom/dropbox/core/v2/files/CommitInfo$Builder;
    .locals 0

    if-eqz p1, :cond_0

    .line 378
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    iput-boolean p1, p0, Lcom/dropbox/core/v2/files/CommitInfo$Builder;->strictConflict:Z

    return-object p0

    :cond_0
    const/4 p1, 0x0

    .line 381
    iput-boolean p1, p0, Lcom/dropbox/core/v2/files/CommitInfo$Builder;->strictConflict:Z

    return-object p0
.end method
