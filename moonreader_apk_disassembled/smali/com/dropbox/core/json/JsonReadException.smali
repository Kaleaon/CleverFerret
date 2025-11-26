.class public final Lcom/dropbox/core/json/JsonReadException;
.super Ljava/lang/Exception;
.source "JsonReadException.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/json/JsonReadException$PathPart;
    }
.end annotation


# static fields
.field public static final serialVersionUID:J


# instance fields
.field public final error:Ljava/lang/String;

.field public final location:Lcom/fasterxml/jackson/core/JsonLocation;

.field private path:Lcom/dropbox/core/json/JsonReadException$PathPart;


# direct methods
.method public constructor <init>(Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonLocation;)V
    .locals 0

    .line 19
    invoke-direct {p0}, Ljava/lang/Exception;-><init>()V

    .line 20
    iput-object p1, p0, Lcom/dropbox/core/json/JsonReadException;->error:Ljava/lang/String;

    .line 21
    iput-object p2, p0, Lcom/dropbox/core/json/JsonReadException;->location:Lcom/fasterxml/jackson/core/JsonLocation;

    const/4 p1, 0x0

    .line 22
    iput-object p1, p0, Lcom/dropbox/core/json/JsonReadException;->path:Lcom/dropbox/core/json/JsonReadException$PathPart;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonLocation;Ljava/lang/Throwable;)V
    .locals 0

    .line 27
    invoke-direct {p0, p3}, Ljava/lang/Exception;-><init>(Ljava/lang/Throwable;)V

    .line 28
    iput-object p1, p0, Lcom/dropbox/core/json/JsonReadException;->error:Ljava/lang/String;

    .line 29
    iput-object p2, p0, Lcom/dropbox/core/json/JsonReadException;->location:Lcom/fasterxml/jackson/core/JsonLocation;

    const/4 p1, 0x0

    .line 30
    iput-object p1, p0, Lcom/dropbox/core/json/JsonReadException;->path:Lcom/dropbox/core/json/JsonReadException$PathPart;

    return-void
.end method

.method public static fromJackson(Lcom/fasterxml/jackson/core/JsonProcessingException;)Lcom/dropbox/core/json/JsonReadException;
    .locals 3

    .line 99
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonProcessingException;->getMessage()Ljava/lang/String;

    move-result-object v0

    .line 102
    const-string v1, " at [Source"

    invoke-virtual {v0, v1}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v1

    if-ltz v1, :cond_0

    const/4 v2, 0x0

    .line 104
    invoke-virtual {v0, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 107
    :cond_0
    new-instance v1, Lcom/dropbox/core/json/JsonReadException;

    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonProcessingException;->getLocation()Lcom/fasterxml/jackson/core/JsonLocation;

    move-result-object p0

    invoke-direct {v1, v0, p0}, Lcom/dropbox/core/json/JsonReadException;-><init>(Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonLocation;)V

    return-object v1
.end method

.method public static toStringLocation(Ljava/lang/StringBuilder;Lcom/fasterxml/jackson/core/JsonLocation;)V
    .locals 2

    .line 73
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonLocation;->getSourceRef()Ljava/lang/Object;

    move-result-object v0

    .line 74
    instance-of v1, v0, Ljava/io/File;

    if-eqz v1, :cond_0

    .line 75
    check-cast v0, Ljava/io/File;

    .line 76
    invoke-virtual {v0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 77
    const-string v0, ": "

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 80
    :cond_0
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonLocation;->getLineNr()I

    move-result v0

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 81
    const-string v0, "."

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 82
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonLocation;->getColumnNr()I

    move-result p1

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    return-void
.end method


# virtual methods
.method public addArrayContext(I)Lcom/dropbox/core/json/JsonReadException;
    .locals 2

    .line 41
    new-instance v0, Lcom/dropbox/core/json/JsonReadException$PathPart;

    invoke-static {p1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object p1

    iget-object v1, p0, Lcom/dropbox/core/json/JsonReadException;->path:Lcom/dropbox/core/json/JsonReadException$PathPart;

    invoke-direct {v0, p1, v1}, Lcom/dropbox/core/json/JsonReadException$PathPart;-><init>(Ljava/lang/String;Lcom/dropbox/core/json/JsonReadException$PathPart;)V

    iput-object v0, p0, Lcom/dropbox/core/json/JsonReadException;->path:Lcom/dropbox/core/json/JsonReadException$PathPart;

    return-object p0
.end method

.method public addFieldContext(Ljava/lang/String;)Lcom/dropbox/core/json/JsonReadException;
    .locals 3

    .line 35
    new-instance v0, Lcom/dropbox/core/json/JsonReadException$PathPart;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "\""

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 p1, 0x22

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    iget-object v1, p0, Lcom/dropbox/core/json/JsonReadException;->path:Lcom/dropbox/core/json/JsonReadException$PathPart;

    invoke-direct {v0, p1, v1}, Lcom/dropbox/core/json/JsonReadException$PathPart;-><init>(Ljava/lang/String;Lcom/dropbox/core/json/JsonReadException$PathPart;)V

    iput-object v0, p0, Lcom/dropbox/core/json/JsonReadException;->path:Lcom/dropbox/core/json/JsonReadException$PathPart;

    return-object p0
.end method

.method public getMessage()Ljava/lang/String;
    .locals 4

    .line 47
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 50
    iget-object v1, p0, Lcom/dropbox/core/json/JsonReadException;->location:Lcom/fasterxml/jackson/core/JsonLocation;

    invoke-static {v0, v1}, Lcom/dropbox/core/json/JsonReadException;->toStringLocation(Ljava/lang/StringBuilder;Lcom/fasterxml/jackson/core/JsonLocation;)V

    .line 51
    const-string v1, ": "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 54
    iget-object v2, p0, Lcom/dropbox/core/json/JsonReadException;->path:Lcom/dropbox/core/json/JsonReadException$PathPart;

    if-eqz v2, :cond_1

    .line 56
    iget-object v3, v2, Lcom/dropbox/core/json/JsonReadException$PathPart;->description:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 57
    :goto_0
    iget-object v3, v2, Lcom/dropbox/core/json/JsonReadException$PathPart;->next:Lcom/dropbox/core/json/JsonReadException$PathPart;

    if-eqz v3, :cond_0

    .line 58
    iget-object v2, v2, Lcom/dropbox/core/json/JsonReadException$PathPart;->next:Lcom/dropbox/core/json/JsonReadException$PathPart;

    .line 59
    const-string v3, "."

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 60
    iget-object v3, v2, Lcom/dropbox/core/json/JsonReadException$PathPart;->description:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 62
    :cond_0
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    :cond_1
    iget-object v1, p0, Lcom/dropbox/core/json/JsonReadException;->error:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 68
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
