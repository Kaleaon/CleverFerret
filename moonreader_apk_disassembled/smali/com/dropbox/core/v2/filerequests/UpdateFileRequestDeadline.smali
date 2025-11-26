.class public final Lcom/dropbox/core/v2/filerequests/UpdateFileRequestDeadline;
.super Ljava/lang/Object;
.source "UpdateFileRequestDeadline.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/filerequests/UpdateFileRequestDeadline$Serializer;,
        Lcom/dropbox/core/v2/filerequests/UpdateFileRequestDeadline$Tag;
    }
.end annotation


# static fields
.field public static final NO_UPDATE:Lcom/dropbox/core/v2/filerequests/UpdateFileRequestDeadline;

.field public static final OTHER:Lcom/dropbox/core/v2/filerequests/UpdateFileRequestDeadline;


# instance fields
.field private _tag:Lcom/dropbox/core/v2/filerequests/UpdateFileRequestDeadline$Tag;

.field private updateValue:Lcom/dropbox/core/v2/filerequests/FileRequestDeadline;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 58
    new-instance v0, Lcom/dropbox/core/v2/filerequests/UpdateFileRequestDeadline;

    invoke-direct {v0}, Lcom/dropbox/core/v2/filerequests/UpdateFileRequestDeadline;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/filerequests/UpdateFileRequestDeadline$Tag;->NO_UPDATE:Lcom/dropbox/core/v2/filerequests/UpdateFileRequestDeadline$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/filerequests/UpdateFileRequestDeadline;->withTag(Lcom/dropbox/core/v2/filerequests/UpdateFileRequestDeadline$Tag;)Lcom/dropbox/core/v2/filerequests/UpdateFileRequestDeadline;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/filerequests/UpdateFileRequestDeadline;->NO_UPDATE:Lcom/dropbox/core/v2/filerequests/UpdateFileRequestDeadline;

    .line 66
    new-instance v0, Lcom/dropbox/core/v2/filerequests/UpdateFileRequestDeadline;

    invoke-direct {v0}, Lcom/dropbox/core/v2/filerequests/UpdateFileRequestDeadline;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/filerequests/UpdateFileRequestDeadline$Tag;->OTHER:Lcom/dropbox/core/v2/filerequests/UpdateFileRequestDeadline$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/filerequests/UpdateFileRequestDeadline;->withTag(Lcom/dropbox/core/v2/filerequests/UpdateFileRequestDeadline$Tag;)Lcom/dropbox/core/v2/filerequests/UpdateFileRequestDeadline;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/filerequests/UpdateFileRequestDeadline;->OTHER:Lcom/dropbox/core/v2/filerequests/UpdateFileRequestDeadline;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 74
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/dropbox/core/v2/filerequests/UpdateFileRequestDeadline;)Lcom/dropbox/core/v2/filerequests/FileRequestDeadline;
    .locals 0

    .line 29
    iget-object p0, p0, Lcom/dropbox/core/v2/filerequests/UpdateFileRequestDeadline;->updateValue:Lcom/dropbox/core/v2/filerequests/FileRequestDeadline;

    return-object p0
.end method

.method public static update()Lcom/dropbox/core/v2/filerequests/UpdateFileRequestDeadline;
    .locals 1

    const/4 v0, 0x0

    .line 166
    invoke-static {v0}, Lcom/dropbox/core/v2/filerequests/UpdateFileRequestDeadline;->update(Lcom/dropbox/core/v2/filerequests/FileRequestDeadline;)Lcom/dropbox/core/v2/filerequests/UpdateFileRequestDeadline;

    move-result-object v0

    return-object v0
.end method

.method public static update(Lcom/dropbox/core/v2/filerequests/FileRequestDeadline;)Lcom/dropbox/core/v2/filerequests/UpdateFileRequestDeadline;
    .locals 2

    .line 153
    new-instance v0, Lcom/dropbox/core/v2/filerequests/UpdateFileRequestDeadline;

    invoke-direct {v0}, Lcom/dropbox/core/v2/filerequests/UpdateFileRequestDeadline;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/filerequests/UpdateFileRequestDeadline$Tag;->UPDATE:Lcom/dropbox/core/v2/filerequests/UpdateFileRequestDeadline$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/filerequests/UpdateFileRequestDeadline;->withTagAndUpdate(Lcom/dropbox/core/v2/filerequests/UpdateFileRequestDeadline$Tag;Lcom/dropbox/core/v2/filerequests/FileRequestDeadline;)Lcom/dropbox/core/v2/filerequests/UpdateFileRequestDeadline;

    move-result-object p0

    return-object p0
.end method

.method private withTag(Lcom/dropbox/core/v2/filerequests/UpdateFileRequestDeadline$Tag;)Lcom/dropbox/core/v2/filerequests/UpdateFileRequestDeadline;
    .locals 1

    .line 83
    new-instance v0, Lcom/dropbox/core/v2/filerequests/UpdateFileRequestDeadline;

    invoke-direct {v0}, Lcom/dropbox/core/v2/filerequests/UpdateFileRequestDeadline;-><init>()V

    .line 84
    iput-object p1, v0, Lcom/dropbox/core/v2/filerequests/UpdateFileRequestDeadline;->_tag:Lcom/dropbox/core/v2/filerequests/UpdateFileRequestDeadline$Tag;

    return-object v0
.end method

.method private withTagAndUpdate(Lcom/dropbox/core/v2/filerequests/UpdateFileRequestDeadline$Tag;Lcom/dropbox/core/v2/filerequests/FileRequestDeadline;)Lcom/dropbox/core/v2/filerequests/UpdateFileRequestDeadline;
    .locals 1

    .line 95
    new-instance v0, Lcom/dropbox/core/v2/filerequests/UpdateFileRequestDeadline;

    invoke-direct {v0}, Lcom/dropbox/core/v2/filerequests/UpdateFileRequestDeadline;-><init>()V

    .line 96
    iput-object p1, v0, Lcom/dropbox/core/v2/filerequests/UpdateFileRequestDeadline;->_tag:Lcom/dropbox/core/v2/filerequests/UpdateFileRequestDeadline$Tag;

    .line 97
    iput-object p2, v0, Lcom/dropbox/core/v2/filerequests/UpdateFileRequestDeadline;->updateValue:Lcom/dropbox/core/v2/filerequests/FileRequestDeadline;

    return-object v0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    if-ne p1, p0, :cond_0

    return v0

    :cond_0
    const/4 v1, 0x0

    if-nez p1, :cond_1

    return v1

    .line 214
    :cond_1
    instance-of v2, p1, Lcom/dropbox/core/v2/filerequests/UpdateFileRequestDeadline;

    if-eqz v2, :cond_7

    .line 215
    check-cast p1, Lcom/dropbox/core/v2/filerequests/UpdateFileRequestDeadline;

    .line 216
    iget-object v2, p0, Lcom/dropbox/core/v2/filerequests/UpdateFileRequestDeadline;->_tag:Lcom/dropbox/core/v2/filerequests/UpdateFileRequestDeadline$Tag;

    iget-object v3, p1, Lcom/dropbox/core/v2/filerequests/UpdateFileRequestDeadline;->_tag:Lcom/dropbox/core/v2/filerequests/UpdateFileRequestDeadline$Tag;

    if-eq v2, v3, :cond_2

    return v1

    .line 219
    :cond_2
    sget-object v2, Lcom/dropbox/core/v2/filerequests/UpdateFileRequestDeadline$1;->$SwitchMap$com$dropbox$core$v2$filerequests$UpdateFileRequestDeadline$Tag:[I

    iget-object v3, p0, Lcom/dropbox/core/v2/filerequests/UpdateFileRequestDeadline;->_tag:Lcom/dropbox/core/v2/filerequests/UpdateFileRequestDeadline$Tag;

    invoke-virtual {v3}, Lcom/dropbox/core/v2/filerequests/UpdateFileRequestDeadline$Tag;->ordinal()I

    move-result v3

    aget v2, v2, v3

    if-eq v2, v0, :cond_6

    const/4 v3, 0x2

    if-eq v2, v3, :cond_4

    const/4 p1, 0x3

    if-eq v2, p1, :cond_3

    return v1

    :cond_3
    return v0

    .line 223
    :cond_4
    iget-object v2, p0, Lcom/dropbox/core/v2/filerequests/UpdateFileRequestDeadline;->updateValue:Lcom/dropbox/core/v2/filerequests/FileRequestDeadline;

    iget-object p1, p1, Lcom/dropbox/core/v2/filerequests/UpdateFileRequestDeadline;->updateValue:Lcom/dropbox/core/v2/filerequests/FileRequestDeadline;

    if-eq v2, p1, :cond_6

    if-eqz v2, :cond_5

    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/filerequests/FileRequestDeadline;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_5

    goto :goto_0

    :cond_5
    return v1

    :cond_6
    :goto_0
    return v0

    :cond_7
    return v1
.end method

.method public getUpdateValue()Lcom/dropbox/core/v2/filerequests/FileRequestDeadline;
    .locals 3

    .line 180
    iget-object v0, p0, Lcom/dropbox/core/v2/filerequests/UpdateFileRequestDeadline;->_tag:Lcom/dropbox/core/v2/filerequests/UpdateFileRequestDeadline$Tag;

    sget-object v1, Lcom/dropbox/core/v2/filerequests/UpdateFileRequestDeadline$Tag;->UPDATE:Lcom/dropbox/core/v2/filerequests/UpdateFileRequestDeadline$Tag;

    if-ne v0, v1, :cond_0

    .line 183
    iget-object v0, p0, Lcom/dropbox/core/v2/filerequests/UpdateFileRequestDeadline;->updateValue:Lcom/dropbox/core/v2/filerequests/FileRequestDeadline;

    return-object v0

    .line 181
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.UPDATE, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/filerequests/UpdateFileRequestDeadline;->_tag:Lcom/dropbox/core/v2/filerequests/UpdateFileRequestDeadline$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/filerequests/UpdateFileRequestDeadline$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public hashCode()I
    .locals 4

    .line 199
    iget-object v0, p0, Lcom/dropbox/core/v2/filerequests/UpdateFileRequestDeadline;->_tag:Lcom/dropbox/core/v2/filerequests/UpdateFileRequestDeadline$Tag;

    iget-object v1, p0, Lcom/dropbox/core/v2/filerequests/UpdateFileRequestDeadline;->updateValue:Lcom/dropbox/core/v2/filerequests/FileRequestDeadline;

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object v0, v2, v3

    const/4 v0, 0x1

    aput-object v1, v2, v0

    invoke-static {v2}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public isNoUpdate()Z
    .locals 2

    .line 127
    iget-object v0, p0, Lcom/dropbox/core/v2/filerequests/UpdateFileRequestDeadline;->_tag:Lcom/dropbox/core/v2/filerequests/UpdateFileRequestDeadline$Tag;

    sget-object v1, Lcom/dropbox/core/v2/filerequests/UpdateFileRequestDeadline$Tag;->NO_UPDATE:Lcom/dropbox/core/v2/filerequests/UpdateFileRequestDeadline$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isOther()Z
    .locals 2

    .line 194
    iget-object v0, p0, Lcom/dropbox/core/v2/filerequests/UpdateFileRequestDeadline;->_tag:Lcom/dropbox/core/v2/filerequests/UpdateFileRequestDeadline$Tag;

    sget-object v1, Lcom/dropbox/core/v2/filerequests/UpdateFileRequestDeadline$Tag;->OTHER:Lcom/dropbox/core/v2/filerequests/UpdateFileRequestDeadline$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isUpdate()Z
    .locals 2

    .line 138
    iget-object v0, p0, Lcom/dropbox/core/v2/filerequests/UpdateFileRequestDeadline;->_tag:Lcom/dropbox/core/v2/filerequests/UpdateFileRequestDeadline$Tag;

    sget-object v1, Lcom/dropbox/core/v2/filerequests/UpdateFileRequestDeadline$Tag;->UPDATE:Lcom/dropbox/core/v2/filerequests/UpdateFileRequestDeadline$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public tag()Lcom/dropbox/core/v2/filerequests/UpdateFileRequestDeadline$Tag;
    .locals 1

    .line 116
    iget-object v0, p0, Lcom/dropbox/core/v2/filerequests/UpdateFileRequestDeadline;->_tag:Lcom/dropbox/core/v2/filerequests/UpdateFileRequestDeadline$Tag;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 237
    sget-object v0, Lcom/dropbox/core/v2/filerequests/UpdateFileRequestDeadline$Serializer;->INSTANCE:Lcom/dropbox/core/v2/filerequests/UpdateFileRequestDeadline$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/filerequests/UpdateFileRequestDeadline$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 249
    sget-object v0, Lcom/dropbox/core/v2/filerequests/UpdateFileRequestDeadline$Serializer;->INSTANCE:Lcom/dropbox/core/v2/filerequests/UpdateFileRequestDeadline$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/filerequests/UpdateFileRequestDeadline$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
