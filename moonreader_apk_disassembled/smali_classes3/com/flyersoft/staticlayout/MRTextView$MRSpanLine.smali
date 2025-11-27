.class Lcom/flyersoft/staticlayout/MRTextView$MRSpanLine;
.super Ljava/lang/Object;
.source "MRTextView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/staticlayout/MRTextView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "MRSpanLine"
.end annotation


# instance fields
.field line:I

.field mrSpans:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/staticlayout/MRTextView$MRSpan;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>()V
    .locals 1

    .line 1079
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1081
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/flyersoft/staticlayout/MRTextView$MRSpanLine;->mrSpans:Ljava/util/ArrayList;

    return-void
.end method
