.class public Lcom/radaee/pdf/Page$Finder;
.super Ljava/lang/Object;
.source "Page.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/radaee/pdf/Page;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "Finder"
.end annotation


# instance fields
.field protected hand:J

.field final synthetic this$0:Lcom/radaee/pdf/Page;


# direct methods
.method public constructor <init>(Lcom/radaee/pdf/Page;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 1464
    iput-object p1, p0, Lcom/radaee/pdf/Page$Finder;->this$0:Lcom/radaee/pdf/Page;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final Close()V
    .locals 2

    .line 1493
    iget-wide v0, p0, Lcom/radaee/pdf/Page$Finder;->hand:J

    invoke-static {v0, v1}, Lcom/radaee/pdf/Page;->access$12700(J)V

    const-wide/16 v0, 0x0

    .line 1494
    iput-wide v0, p0, Lcom/radaee/pdf/Page$Finder;->hand:J

    return-void
.end method

.method public final GetCount()I
    .locals 2

    .line 1473
    iget-wide v0, p0, Lcom/radaee/pdf/Page$Finder;->hand:J

    invoke-static {v0, v1}, Lcom/radaee/pdf/Page;->access$12400(J)I

    move-result v0

    return v0
.end method

.method public final GetEndChar(I)I
    .locals 2

    .line 1486
    iget-wide v0, p0, Lcom/radaee/pdf/Page$Finder;->hand:J

    invoke-static {v0, v1, p1}, Lcom/radaee/pdf/Page;->access$12600(JI)I

    move-result p1

    return p1
.end method

.method public final GetFirstChar(I)I
    .locals 2

    .line 1482
    iget-wide v0, p0, Lcom/radaee/pdf/Page$Finder;->hand:J

    invoke-static {v0, v1, p1}, Lcom/radaee/pdf/Page;->access$12500(JI)I

    move-result p1

    return p1
.end method

.method protected finalize()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 1499
    invoke-virtual {p0}, Lcom/radaee/pdf/Page$Finder;->Close()V

    .line 1500
    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    return-void
.end method
