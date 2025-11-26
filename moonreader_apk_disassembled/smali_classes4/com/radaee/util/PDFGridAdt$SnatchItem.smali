.class public Lcom/radaee/util/PDFGridAdt$SnatchItem;
.super Ljava/lang/Object;
.source "PDFGridAdt.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/radaee/util/PDFGridAdt;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "SnatchItem"
.end annotation


# instance fields
.field public m_item:Lcom/radaee/util/PDFGridItem;

.field public m_name:Ljava/lang/String;

.field public m_path:Ljava/lang/String;

.field final synthetic this$0:Lcom/radaee/util/PDFGridAdt;


# direct methods
.method public constructor <init>(Lcom/radaee/util/PDFGridAdt;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 31
    iput-object p1, p0, Lcom/radaee/util/PDFGridAdt$SnatchItem;->this$0:Lcom/radaee/util/PDFGridAdt;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
