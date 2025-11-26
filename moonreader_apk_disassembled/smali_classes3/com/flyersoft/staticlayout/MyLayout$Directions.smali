.class public Lcom/flyersoft/staticlayout/MyLayout$Directions;
.super Ljava/lang/Object;
.source "MyLayout.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/staticlayout/MyLayout;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Directions"
.end annotation


# instance fields
.field private mDirections:[S


# direct methods
.method static bridge synthetic -$$Nest$fgetmDirections(Lcom/flyersoft/staticlayout/MyLayout$Directions;)[S
    .locals 0

    iget-object p0, p0, Lcom/flyersoft/staticlayout/MyLayout$Directions;->mDirections:[S

    return-object p0
.end method

.method constructor <init>([S)V
    .locals 0

    .line 1383
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1384
    iput-object p1, p0, Lcom/flyersoft/staticlayout/MyLayout$Directions;->mDirections:[S

    return-void
.end method
