.class public Lorg/nibor/autolink/internal/LinkSpanImpl;
.super Ljava/lang/Object;
.source "LinkSpanImpl.java"

# interfaces
.implements Lorg/nibor/autolink/LinkSpan;


# instance fields
.field private final beginIndex:I

.field private final endIndex:I

.field private final linkType:Lorg/nibor/autolink/LinkType;


# direct methods
.method public constructor <init>(Lorg/nibor/autolink/LinkType;II)V
    .locals 0

    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 13
    iput-object p1, p0, Lorg/nibor/autolink/internal/LinkSpanImpl;->linkType:Lorg/nibor/autolink/LinkType;

    .line 14
    iput p2, p0, Lorg/nibor/autolink/internal/LinkSpanImpl;->beginIndex:I

    .line 15
    iput p3, p0, Lorg/nibor/autolink/internal/LinkSpanImpl;->endIndex:I

    return-void
.end method


# virtual methods
.method public getBeginIndex()I
    .locals 1

    .line 25
    iget v0, p0, Lorg/nibor/autolink/internal/LinkSpanImpl;->beginIndex:I

    return v0
.end method

.method public getEndIndex()I
    .locals 1

    .line 30
    iget v0, p0, Lorg/nibor/autolink/internal/LinkSpanImpl;->endIndex:I

    return v0
.end method

.method public getType()Lorg/nibor/autolink/LinkType;
    .locals 1

    .line 20
    iget-object v0, p0, Lorg/nibor/autolink/internal/LinkSpanImpl;->linkType:Lorg/nibor/autolink/LinkType;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 35
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Link{type="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lorg/nibor/autolink/internal/LinkSpanImpl;->getType()Lorg/nibor/autolink/LinkType;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", beginIndex="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lorg/nibor/autolink/internal/LinkSpanImpl;->beginIndex:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", endIndex="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lorg/nibor/autolink/internal/LinkSpanImpl;->endIndex:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
