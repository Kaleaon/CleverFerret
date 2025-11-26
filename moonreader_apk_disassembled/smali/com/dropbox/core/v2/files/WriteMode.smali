.class public final Lcom/dropbox/core/v2/files/WriteMode;
.super Ljava/lang/Object;
.source "WriteMode.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/files/WriteMode$Serializer;,
        Lcom/dropbox/core/v2/files/WriteMode$Tag;
    }
.end annotation


# static fields
.field public static final ADD:Lcom/dropbox/core/v2/files/WriteMode;

.field public static final OVERWRITE:Lcom/dropbox/core/v2/files/WriteMode;


# instance fields
.field private _tag:Lcom/dropbox/core/v2/files/WriteMode$Tag;

.field private updateValue:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 73
    new-instance v0, Lcom/dropbox/core/v2/files/WriteMode;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/WriteMode;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/files/WriteMode$Tag;->ADD:Lcom/dropbox/core/v2/files/WriteMode$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/files/WriteMode;->withTag(Lcom/dropbox/core/v2/files/WriteMode$Tag;)Lcom/dropbox/core/v2/files/WriteMode;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/files/WriteMode;->ADD:Lcom/dropbox/core/v2/files/WriteMode;

    .line 78
    new-instance v0, Lcom/dropbox/core/v2/files/WriteMode;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/WriteMode;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/files/WriteMode$Tag;->OVERWRITE:Lcom/dropbox/core/v2/files/WriteMode$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/files/WriteMode;->withTag(Lcom/dropbox/core/v2/files/WriteMode$Tag;)Lcom/dropbox/core/v2/files/WriteMode;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/files/WriteMode;->OVERWRITE:Lcom/dropbox/core/v2/files/WriteMode;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 86
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/dropbox/core/v2/files/WriteMode;)Ljava/lang/String;
    .locals 0

    .line 36
    iget-object p0, p0, Lcom/dropbox/core/v2/files/WriteMode;->updateValue:Ljava/lang/String;

    return-object p0
.end method

.method public static update(Ljava/lang/String;)Lcom/dropbox/core/v2/files/WriteMode;
    .locals 2

    if-eqz p0, :cond_2

    .line 217
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0x9

    if-lt v0, v1, :cond_1

    .line 220
    const-string v0, "[0-9a-f]+"

    invoke-static {v0, p0}, Ljava/util/regex/Pattern;->matches(Ljava/lang/String;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 223
    new-instance v0, Lcom/dropbox/core/v2/files/WriteMode;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/WriteMode;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/files/WriteMode$Tag;->UPDATE:Lcom/dropbox/core/v2/files/WriteMode$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/files/WriteMode;->withTagAndUpdate(Lcom/dropbox/core/v2/files/WriteMode$Tag;Ljava/lang/String;)Lcom/dropbox/core/v2/files/WriteMode;

    move-result-object p0

    return-object p0

    .line 221
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "String does not match pattern"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 218
    :cond_1
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "String is shorter than 9"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 215
    :cond_2
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private withTag(Lcom/dropbox/core/v2/files/WriteMode$Tag;)Lcom/dropbox/core/v2/files/WriteMode;
    .locals 1

    .line 104
    new-instance v0, Lcom/dropbox/core/v2/files/WriteMode;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/WriteMode;-><init>()V

    .line 105
    iput-object p1, v0, Lcom/dropbox/core/v2/files/WriteMode;->_tag:Lcom/dropbox/core/v2/files/WriteMode$Tag;

    return-object v0
.end method

.method private withTagAndUpdate(Lcom/dropbox/core/v2/files/WriteMode$Tag;Ljava/lang/String;)Lcom/dropbox/core/v2/files/WriteMode;
    .locals 1

    .line 137
    new-instance v0, Lcom/dropbox/core/v2/files/WriteMode;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/WriteMode;-><init>()V

    .line 138
    iput-object p1, v0, Lcom/dropbox/core/v2/files/WriteMode;->_tag:Lcom/dropbox/core/v2/files/WriteMode$Tag;

    .line 139
    iput-object p2, v0, Lcom/dropbox/core/v2/files/WriteMode;->updateValue:Ljava/lang/String;

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

    .line 268
    :cond_1
    instance-of v2, p1, Lcom/dropbox/core/v2/files/WriteMode;

    if-eqz v2, :cond_6

    .line 269
    check-cast p1, Lcom/dropbox/core/v2/files/WriteMode;

    .line 270
    iget-object v2, p0, Lcom/dropbox/core/v2/files/WriteMode;->_tag:Lcom/dropbox/core/v2/files/WriteMode$Tag;

    iget-object v3, p1, Lcom/dropbox/core/v2/files/WriteMode;->_tag:Lcom/dropbox/core/v2/files/WriteMode$Tag;

    if-eq v2, v3, :cond_2

    return v1

    .line 273
    :cond_2
    sget-object v2, Lcom/dropbox/core/v2/files/WriteMode$1;->$SwitchMap$com$dropbox$core$v2$files$WriteMode$Tag:[I

    iget-object v3, p0, Lcom/dropbox/core/v2/files/WriteMode;->_tag:Lcom/dropbox/core/v2/files/WriteMode$Tag;

    invoke-virtual {v3}, Lcom/dropbox/core/v2/files/WriteMode$Tag;->ordinal()I

    move-result v3

    aget v2, v2, v3

    if-eq v2, v0, :cond_5

    const/4 v3, 0x2

    if-eq v2, v3, :cond_5

    const/4 v3, 0x3

    if-eq v2, v3, :cond_3

    return v1

    .line 279
    :cond_3
    iget-object v2, p0, Lcom/dropbox/core/v2/files/WriteMode;->updateValue:Ljava/lang/String;

    iget-object p1, p1, Lcom/dropbox/core/v2/files/WriteMode;->updateValue:Ljava/lang/String;

    if-eq v2, p1, :cond_5

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_4

    goto :goto_0

    :cond_4
    return v1

    :cond_5
    :goto_0
    return v0

    :cond_6
    return v1
.end method

.method public getUpdateValue()Ljava/lang/String;
    .locals 3

    .line 245
    iget-object v0, p0, Lcom/dropbox/core/v2/files/WriteMode;->_tag:Lcom/dropbox/core/v2/files/WriteMode$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/WriteMode$Tag;->UPDATE:Lcom/dropbox/core/v2/files/WriteMode$Tag;

    if-ne v0, v1, :cond_0

    .line 248
    iget-object v0, p0, Lcom/dropbox/core/v2/files/WriteMode;->updateValue:Ljava/lang/String;

    return-object v0

    .line 246
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.UPDATE, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/files/WriteMode;->_tag:Lcom/dropbox/core/v2/files/WriteMode$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/files/WriteMode$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public hashCode()I
    .locals 4

    .line 253
    iget-object v0, p0, Lcom/dropbox/core/v2/files/WriteMode;->_tag:Lcom/dropbox/core/v2/files/WriteMode$Tag;

    iget-object v1, p0, Lcom/dropbox/core/v2/files/WriteMode;->updateValue:Ljava/lang/String;

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

.method public isAdd()Z
    .locals 2

    .line 166
    iget-object v0, p0, Lcom/dropbox/core/v2/files/WriteMode;->_tag:Lcom/dropbox/core/v2/files/WriteMode$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/WriteMode$Tag;->ADD:Lcom/dropbox/core/v2/files/WriteMode$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isOverwrite()Z
    .locals 2

    .line 177
    iget-object v0, p0, Lcom/dropbox/core/v2/files/WriteMode;->_tag:Lcom/dropbox/core/v2/files/WriteMode$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/WriteMode$Tag;->OVERWRITE:Lcom/dropbox/core/v2/files/WriteMode$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isUpdate()Z
    .locals 2

    .line 188
    iget-object v0, p0, Lcom/dropbox/core/v2/files/WriteMode;->_tag:Lcom/dropbox/core/v2/files/WriteMode$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/WriteMode$Tag;->UPDATE:Lcom/dropbox/core/v2/files/WriteMode$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public tag()Lcom/dropbox/core/v2/files/WriteMode$Tag;
    .locals 1

    .line 155
    iget-object v0, p0, Lcom/dropbox/core/v2/files/WriteMode;->_tag:Lcom/dropbox/core/v2/files/WriteMode$Tag;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 291
    sget-object v0, Lcom/dropbox/core/v2/files/WriteMode$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/WriteMode$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/files/WriteMode$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 303
    sget-object v0, Lcom/dropbox/core/v2/files/WriteMode$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/WriteMode$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/files/WriteMode$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
