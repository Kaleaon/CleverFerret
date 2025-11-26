.class public Lcom/radaee/pdf/Document$DocGState;
.super Ljava/lang/Object;
.source "Document.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/radaee/pdf/Document;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "DocGState"
.end annotation


# instance fields
.field doc:Lcom/radaee/pdf/Document;

.field protected hand:J


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 464
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public SetBlendMode(I)Z
    .locals 4

    .line 522
    iget-object v0, p0, Lcom/radaee/pdf/Document$DocGState;->doc:Lcom/radaee/pdf/Document;

    iget-wide v0, v0, Lcom/radaee/pdf/Document;->hand_val:J

    iget-wide v2, p0, Lcom/radaee/pdf/Document$DocGState;->hand:J

    invoke-static {v0, v1, v2, v3, p1}, Lcom/radaee/pdf/Document;->access$1700(JJI)Z

    move-result p1

    return p1
.end method

.method public SetFillAlpha(I)Z
    .locals 4

    .line 475
    iget-object v0, p0, Lcom/radaee/pdf/Document$DocGState;->doc:Lcom/radaee/pdf/Document;

    iget-wide v0, v0, Lcom/radaee/pdf/Document;->hand_val:J

    iget-wide v2, p0, Lcom/radaee/pdf/Document$DocGState;->hand:J

    invoke-static {v0, v1, v2, v3, p1}, Lcom/radaee/pdf/Document;->access$1400(JJI)Z

    move-result p1

    return p1
.end method

.method public SetStrokeAlpha(I)Z
    .locals 4

    .line 484
    iget-object v0, p0, Lcom/radaee/pdf/Document$DocGState;->doc:Lcom/radaee/pdf/Document;

    iget-wide v0, v0, Lcom/radaee/pdf/Document;->hand_val:J

    iget-wide v2, p0, Lcom/radaee/pdf/Document$DocGState;->hand:J

    invoke-static {v0, v1, v2, v3, p1}, Lcom/radaee/pdf/Document;->access$1500(JJI)Z

    move-result p1

    return p1
.end method

.method public SetStrokeDash([FF)Z
    .locals 7

    .line 499
    iget-object v0, p0, Lcom/radaee/pdf/Document$DocGState;->doc:Lcom/radaee/pdf/Document;

    iget-wide v1, v0, Lcom/radaee/pdf/Document;->hand_val:J

    iget-wide v3, p0, Lcom/radaee/pdf/Document$DocGState;->hand:J

    move-object v5, p1

    move v6, p2

    invoke-static/range {v1 .. v6}, Lcom/radaee/pdf/Document;->access$1600(JJ[FF)Z

    move-result p1

    return p1
.end method
