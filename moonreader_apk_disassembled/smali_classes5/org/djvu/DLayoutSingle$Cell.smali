.class public Lorg/djvu/DLayoutSingle$Cell;
.super Ljava/lang/Object;
.source "DLayoutSingle.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/djvu/DLayoutSingle;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4
    name = "Cell"
.end annotation


# instance fields
.field public left:F

.field pageno:I

.field public right:F

.field final synthetic this$0:Lorg/djvu/DLayoutSingle;


# direct methods
.method protected constructor <init>(Lorg/djvu/DLayoutSingle;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 11
    iput-object p1, p0, Lorg/djvu/DLayoutSingle$Cell;->this$0:Lorg/djvu/DLayoutSingle;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
