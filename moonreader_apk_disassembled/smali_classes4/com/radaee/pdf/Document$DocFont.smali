.class public Lcom/radaee/pdf/Document$DocFont;
.super Ljava/lang/Object;
.source "Document.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/radaee/pdf/Document;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "DocFont"
.end annotation


# instance fields
.field doc:Lcom/radaee/pdf/Document;

.field protected hand:J


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 443
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public GetAscent()F
    .locals 4

    .line 453
    iget-object v0, p0, Lcom/radaee/pdf/Document$DocFont;->doc:Lcom/radaee/pdf/Document;

    iget-wide v0, v0, Lcom/radaee/pdf/Document;->hand_val:J

    iget-wide v2, p0, Lcom/radaee/pdf/Document$DocFont;->hand:J

    invoke-static {v0, v1, v2, v3}, Lcom/radaee/pdf/Document;->access$1200(JJ)F

    move-result v0

    return v0
.end method

.method public GetDescent()F
    .locals 4

    .line 461
    iget-object v0, p0, Lcom/radaee/pdf/Document$DocFont;->doc:Lcom/radaee/pdf/Document;

    iget-wide v0, v0, Lcom/radaee/pdf/Document;->hand_val:J

    iget-wide v2, p0, Lcom/radaee/pdf/Document$DocFont;->hand:J

    invoke-static {v0, v1, v2, v3}, Lcom/radaee/pdf/Document;->access$1300(JJ)F

    move-result v0

    return v0
.end method
