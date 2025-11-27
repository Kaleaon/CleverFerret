.class public Lcom/rtfparserkit/parser/RtfStringSource;
.super Ljava/lang/Object;
.source "RtfStringSource.java"

# interfaces
.implements Lcom/rtfparserkit/parser/IRtfSource;


# instance fields
.field private final data:Ljava/lang/String;

.field private index:I


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 40
    iput-object p1, p0, Lcom/rtfparserkit/parser/RtfStringSource;->data:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public read()I
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 48
    iget v0, p0, Lcom/rtfparserkit/parser/RtfStringSource;->index:I

    iget-object v1, p0, Lcom/rtfparserkit/parser/RtfStringSource;->data:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-ne v0, v1, :cond_0

    const/4 v0, -0x1

    return v0

    .line 54
    :cond_0
    iget-object v0, p0, Lcom/rtfparserkit/parser/RtfStringSource;->data:Ljava/lang/String;

    iget v1, p0, Lcom/rtfparserkit/parser/RtfStringSource;->index:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/rtfparserkit/parser/RtfStringSource;->index:I

    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    return v0
.end method

.method public read([B)I
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 73
    new-instance p1, Ljava/lang/UnsupportedOperationException;

    invoke-direct {p1}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw p1
.end method

.method public unread(I)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 63
    iget p1, p0, Lcom/rtfparserkit/parser/RtfStringSource;->index:I

    if-eqz p1, :cond_0

    add-int/lit8 p1, p1, -0x1

    .line 67
    iput p1, p0, Lcom/rtfparserkit/parser/RtfStringSource;->index:I

    return-void

    .line 65
    :cond_0
    new-instance p1, Ljava/io/IOException;

    const-string v0, "Unread not possible"

    invoke-direct {p1, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
