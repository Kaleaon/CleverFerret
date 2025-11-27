.class public Lorg/comic/CLayoutSingle$Cell;
.super Ljava/lang/Object;
.source "CLayoutSingle.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/comic/CLayoutSingle;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4
    name = "Cell"
.end annotation


# instance fields
.field public left:F

.field pageno:I

.field public right:F

.field final synthetic this$0:Lorg/comic/CLayoutSingle;


# direct methods
.method protected constructor <init>(Lorg/comic/CLayoutSingle;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 10
    iput-object p1, p0, Lorg/comic/CLayoutSingle$Cell;->this$0:Lorg/comic/CLayoutSingle;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
