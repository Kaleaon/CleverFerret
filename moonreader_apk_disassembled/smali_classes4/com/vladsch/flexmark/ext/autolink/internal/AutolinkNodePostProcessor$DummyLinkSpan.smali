.class Lcom/vladsch/flexmark/ext/autolink/internal/AutolinkNodePostProcessor$DummyLinkSpan;
.super Ljava/lang/Object;
.source "AutolinkNodePostProcessor.java"

# interfaces
.implements Lorg/nibor/autolink/LinkSpan;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vladsch/flexmark/ext/autolink/internal/AutolinkNodePostProcessor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "DummyLinkSpan"
.end annotation


# instance fields
.field private final beginIndex:I

.field private final endIndex:I

.field private final linkType:Lorg/nibor/autolink/LinkType;


# direct methods
.method public constructor <init>(Lorg/nibor/autolink/LinkType;II)V
    .locals 0

    .line 60
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 61
    iput-object p1, p0, Lcom/vladsch/flexmark/ext/autolink/internal/AutolinkNodePostProcessor$DummyLinkSpan;->linkType:Lorg/nibor/autolink/LinkType;

    .line 62
    iput p2, p0, Lcom/vladsch/flexmark/ext/autolink/internal/AutolinkNodePostProcessor$DummyLinkSpan;->beginIndex:I

    .line 63
    iput p3, p0, Lcom/vladsch/flexmark/ext/autolink/internal/AutolinkNodePostProcessor$DummyLinkSpan;->endIndex:I

    return-void
.end method


# virtual methods
.method public getBeginIndex()I
    .locals 1

    .line 73
    iget v0, p0, Lcom/vladsch/flexmark/ext/autolink/internal/AutolinkNodePostProcessor$DummyLinkSpan;->beginIndex:I

    return v0
.end method

.method public getEndIndex()I
    .locals 1

    .line 78
    iget v0, p0, Lcom/vladsch/flexmark/ext/autolink/internal/AutolinkNodePostProcessor$DummyLinkSpan;->endIndex:I

    return v0
.end method

.method public getType()Lorg/nibor/autolink/LinkType;
    .locals 1

    .line 68
    iget-object v0, p0, Lcom/vladsch/flexmark/ext/autolink/internal/AutolinkNodePostProcessor$DummyLinkSpan;->linkType:Lorg/nibor/autolink/LinkType;

    return-object v0
.end method
