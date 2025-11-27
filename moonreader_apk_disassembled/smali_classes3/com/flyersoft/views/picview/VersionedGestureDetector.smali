.class public final Lcom/flyersoft/views/picview/VersionedGestureDetector;
.super Ljava/lang/Object;
.source "VersionedGestureDetector.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static newInstance(Landroid/content/Context;Lcom/flyersoft/views/picview/OnGestureListener;)Lcom/flyersoft/views/picview/GestureDetector;
    .locals 1

    .line 34
    new-instance v0, Lcom/flyersoft/views/picview/FroyoGestureDetector;

    invoke-direct {v0, p0}, Lcom/flyersoft/views/picview/FroyoGestureDetector;-><init>(Landroid/content/Context;)V

    .line 37
    invoke-interface {v0, p1}, Lcom/flyersoft/views/picview/GestureDetector;->setOnGestureListener(Lcom/flyersoft/views/picview/OnGestureListener;)V

    return-object v0
.end method
