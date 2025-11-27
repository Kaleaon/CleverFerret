.class public Lorg/apache/http/entity/mime/MinimalField;
.super Ljava/lang/Object;
.source "MinimalField.java"

# interfaces
.implements Lorg/apache/james/mime4j/parser/Field;


# instance fields
.field private final name:Ljava/lang/String;

.field private raw:Lorg/apache/james/mime4j/util/ByteSequence;

.field private final value:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 51
    iput-object p1, p0, Lorg/apache/http/entity/mime/MinimalField;->name:Ljava/lang/String;

    .line 52
    iput-object p2, p0, Lorg/apache/http/entity/mime/MinimalField;->value:Ljava/lang/String;

    const/4 p1, 0x0

    .line 53
    iput-object p1, p0, Lorg/apache/http/entity/mime/MinimalField;->raw:Lorg/apache/james/mime4j/util/ByteSequence;

    return-void
.end method


# virtual methods
.method public getBody()Ljava/lang/String;
    .locals 1

    .line 61
    iget-object v0, p0, Lorg/apache/http/entity/mime/MinimalField;->value:Ljava/lang/String;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .line 57
    iget-object v0, p0, Lorg/apache/http/entity/mime/MinimalField;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getRaw()Lorg/apache/james/mime4j/util/ByteSequence;
    .locals 1

    .line 65
    iget-object v0, p0, Lorg/apache/http/entity/mime/MinimalField;->raw:Lorg/apache/james/mime4j/util/ByteSequence;

    if-nez v0, :cond_0

    .line 66
    invoke-virtual {p0}, Lorg/apache/http/entity/mime/MinimalField;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/apache/james/mime4j/util/ContentUtil;->encode(Ljava/lang/String;)Lorg/apache/james/mime4j/util/ByteSequence;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/http/entity/mime/MinimalField;->raw:Lorg/apache/james/mime4j/util/ByteSequence;

    .line 68
    :cond_0
    iget-object v0, p0, Lorg/apache/http/entity/mime/MinimalField;->raw:Lorg/apache/james/mime4j/util/ByteSequence;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 73
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 74
    iget-object v1, p0, Lorg/apache/http/entity/mime/MinimalField;->name:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 75
    const-string v1, ": "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 76
    iget-object v1, p0, Lorg/apache/http/entity/mime/MinimalField;->value:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 77
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
