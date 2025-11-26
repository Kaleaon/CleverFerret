.class public final Lcom/dropbox/core/v2/files/ExportError;
.super Ljava/lang/Object;
.source "ExportError.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/files/ExportError$Serializer;,
        Lcom/dropbox/core/v2/files/ExportError$Tag;
    }
.end annotation


# static fields
.field public static final INVALID_EXPORT_FORMAT:Lcom/dropbox/core/v2/files/ExportError;

.field public static final NON_EXPORTABLE:Lcom/dropbox/core/v2/files/ExportError;

.field public static final OTHER:Lcom/dropbox/core/v2/files/ExportError;

.field public static final RETRY_ERROR:Lcom/dropbox/core/v2/files/ExportError;


# instance fields
.field private _tag:Lcom/dropbox/core/v2/files/ExportError$Tag;

.field private pathValue:Lcom/dropbox/core/v2/files/LookupError;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 65
    new-instance v0, Lcom/dropbox/core/v2/files/ExportError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/ExportError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/files/ExportError$Tag;->NON_EXPORTABLE:Lcom/dropbox/core/v2/files/ExportError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/files/ExportError;->withTag(Lcom/dropbox/core/v2/files/ExportError$Tag;)Lcom/dropbox/core/v2/files/ExportError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/files/ExportError;->NON_EXPORTABLE:Lcom/dropbox/core/v2/files/ExportError;

    .line 69
    new-instance v0, Lcom/dropbox/core/v2/files/ExportError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/ExportError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/files/ExportError$Tag;->INVALID_EXPORT_FORMAT:Lcom/dropbox/core/v2/files/ExportError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/files/ExportError;->withTag(Lcom/dropbox/core/v2/files/ExportError$Tag;)Lcom/dropbox/core/v2/files/ExportError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/files/ExportError;->INVALID_EXPORT_FORMAT:Lcom/dropbox/core/v2/files/ExportError;

    .line 73
    new-instance v0, Lcom/dropbox/core/v2/files/ExportError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/ExportError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/files/ExportError$Tag;->RETRY_ERROR:Lcom/dropbox/core/v2/files/ExportError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/files/ExportError;->withTag(Lcom/dropbox/core/v2/files/ExportError$Tag;)Lcom/dropbox/core/v2/files/ExportError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/files/ExportError;->RETRY_ERROR:Lcom/dropbox/core/v2/files/ExportError;

    .line 81
    new-instance v0, Lcom/dropbox/core/v2/files/ExportError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/ExportError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/files/ExportError$Tag;->OTHER:Lcom/dropbox/core/v2/files/ExportError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/files/ExportError;->withTag(Lcom/dropbox/core/v2/files/ExportError$Tag;)Lcom/dropbox/core/v2/files/ExportError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/files/ExportError;->OTHER:Lcom/dropbox/core/v2/files/ExportError;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 89
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/dropbox/core/v2/files/ExportError;)Lcom/dropbox/core/v2/files/LookupError;
    .locals 0

    .line 29
    iget-object p0, p0, Lcom/dropbox/core/v2/files/ExportError;->pathValue:Lcom/dropbox/core/v2/files/LookupError;

    return-object p0
.end method

.method public static path(Lcom/dropbox/core/v2/files/LookupError;)Lcom/dropbox/core/v2/files/ExportError;
    .locals 2

    if-eqz p0, :cond_0

    .line 164
    new-instance v0, Lcom/dropbox/core/v2/files/ExportError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/ExportError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/files/ExportError$Tag;->PATH:Lcom/dropbox/core/v2/files/ExportError$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/files/ExportError;->withTagAndPath(Lcom/dropbox/core/v2/files/ExportError$Tag;Lcom/dropbox/core/v2/files/LookupError;)Lcom/dropbox/core/v2/files/ExportError;

    move-result-object p0

    return-object p0

    .line 162
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private withTag(Lcom/dropbox/core/v2/files/ExportError$Tag;)Lcom/dropbox/core/v2/files/ExportError;
    .locals 1

    .line 98
    new-instance v0, Lcom/dropbox/core/v2/files/ExportError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/ExportError;-><init>()V

    .line 99
    iput-object p1, v0, Lcom/dropbox/core/v2/files/ExportError;->_tag:Lcom/dropbox/core/v2/files/ExportError$Tag;

    return-object v0
.end method

.method private withTagAndPath(Lcom/dropbox/core/v2/files/ExportError$Tag;Lcom/dropbox/core/v2/files/LookupError;)Lcom/dropbox/core/v2/files/ExportError;
    .locals 1

    .line 112
    new-instance v0, Lcom/dropbox/core/v2/files/ExportError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/ExportError;-><init>()V

    .line 113
    iput-object p1, v0, Lcom/dropbox/core/v2/files/ExportError;->_tag:Lcom/dropbox/core/v2/files/ExportError$Tag;

    .line 114
    iput-object p2, v0, Lcom/dropbox/core/v2/files/ExportError;->pathValue:Lcom/dropbox/core/v2/files/LookupError;

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

    .line 243
    :cond_1
    instance-of v2, p1, Lcom/dropbox/core/v2/files/ExportError;

    if-eqz v2, :cond_7

    .line 244
    check-cast p1, Lcom/dropbox/core/v2/files/ExportError;

    .line 245
    iget-object v2, p0, Lcom/dropbox/core/v2/files/ExportError;->_tag:Lcom/dropbox/core/v2/files/ExportError$Tag;

    iget-object v3, p1, Lcom/dropbox/core/v2/files/ExportError;->_tag:Lcom/dropbox/core/v2/files/ExportError$Tag;

    if-eq v2, v3, :cond_2

    return v1

    .line 248
    :cond_2
    sget-object v2, Lcom/dropbox/core/v2/files/ExportError$1;->$SwitchMap$com$dropbox$core$v2$files$ExportError$Tag:[I

    iget-object v3, p0, Lcom/dropbox/core/v2/files/ExportError;->_tag:Lcom/dropbox/core/v2/files/ExportError$Tag;

    invoke-virtual {v3}, Lcom/dropbox/core/v2/files/ExportError$Tag;->ordinal()I

    move-result v3

    aget v2, v2, v3

    if-eq v2, v0, :cond_4

    const/4 p1, 0x2

    if-eq v2, p1, :cond_3

    const/4 p1, 0x3

    if-eq v2, p1, :cond_3

    const/4 p1, 0x4

    if-eq v2, p1, :cond_3

    const/4 p1, 0x5

    if-eq v2, p1, :cond_3

    return v1

    :cond_3
    return v0

    .line 250
    :cond_4
    iget-object v2, p0, Lcom/dropbox/core/v2/files/ExportError;->pathValue:Lcom/dropbox/core/v2/files/LookupError;

    iget-object p1, p1, Lcom/dropbox/core/v2/files/ExportError;->pathValue:Lcom/dropbox/core/v2/files/LookupError;

    if-eq v2, p1, :cond_6

    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/files/LookupError;->equals(Ljava/lang/Object;)Z

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

.method public getPathValue()Lcom/dropbox/core/v2/files/LookupError;
    .locals 3

    .line 176
    iget-object v0, p0, Lcom/dropbox/core/v2/files/ExportError;->_tag:Lcom/dropbox/core/v2/files/ExportError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/ExportError$Tag;->PATH:Lcom/dropbox/core/v2/files/ExportError$Tag;

    if-ne v0, v1, :cond_0

    .line 179
    iget-object v0, p0, Lcom/dropbox/core/v2/files/ExportError;->pathValue:Lcom/dropbox/core/v2/files/LookupError;

    return-object v0

    .line 177
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.PATH, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/files/ExportError;->_tag:Lcom/dropbox/core/v2/files/ExportError$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/files/ExportError$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public hashCode()I
    .locals 4

    .line 228
    iget-object v0, p0, Lcom/dropbox/core/v2/files/ExportError;->_tag:Lcom/dropbox/core/v2/files/ExportError$Tag;

    iget-object v1, p0, Lcom/dropbox/core/v2/files/ExportError;->pathValue:Lcom/dropbox/core/v2/files/LookupError;

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

.method public isInvalidExportFormat()Z
    .locals 2

    .line 201
    iget-object v0, p0, Lcom/dropbox/core/v2/files/ExportError;->_tag:Lcom/dropbox/core/v2/files/ExportError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/ExportError$Tag;->INVALID_EXPORT_FORMAT:Lcom/dropbox/core/v2/files/ExportError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isNonExportable()Z
    .locals 2

    .line 190
    iget-object v0, p0, Lcom/dropbox/core/v2/files/ExportError;->_tag:Lcom/dropbox/core/v2/files/ExportError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/ExportError$Tag;->NON_EXPORTABLE:Lcom/dropbox/core/v2/files/ExportError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isOther()Z
    .locals 2

    .line 223
    iget-object v0, p0, Lcom/dropbox/core/v2/files/ExportError;->_tag:Lcom/dropbox/core/v2/files/ExportError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/ExportError$Tag;->OTHER:Lcom/dropbox/core/v2/files/ExportError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isPath()Z
    .locals 2

    .line 144
    iget-object v0, p0, Lcom/dropbox/core/v2/files/ExportError;->_tag:Lcom/dropbox/core/v2/files/ExportError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/ExportError$Tag;->PATH:Lcom/dropbox/core/v2/files/ExportError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isRetryError()Z
    .locals 2

    .line 212
    iget-object v0, p0, Lcom/dropbox/core/v2/files/ExportError;->_tag:Lcom/dropbox/core/v2/files/ExportError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/ExportError$Tag;->RETRY_ERROR:Lcom/dropbox/core/v2/files/ExportError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public tag()Lcom/dropbox/core/v2/files/ExportError$Tag;
    .locals 1

    .line 133
    iget-object v0, p0, Lcom/dropbox/core/v2/files/ExportError;->_tag:Lcom/dropbox/core/v2/files/ExportError$Tag;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 270
    sget-object v0, Lcom/dropbox/core/v2/files/ExportError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/ExportError$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/files/ExportError$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 282
    sget-object v0, Lcom/dropbox/core/v2/files/ExportError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/ExportError$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/files/ExportError$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
