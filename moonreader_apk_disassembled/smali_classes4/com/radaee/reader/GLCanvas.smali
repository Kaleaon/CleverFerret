.class public Lcom/radaee/reader/GLCanvas;
.super Landroid/view/View;
.source "GLCanvas.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/radaee/reader/GLCanvas$CanvasListener;
    }
.end annotation


# instance fields
.field private m_listener:Lcom/radaee/reader/GLCanvas$CanvasListener;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 26
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 27
    invoke-direct {p0, p1}, Lcom/radaee/reader/GLCanvas;->init(Landroid/content/Context;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 22
    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 23
    invoke-direct {p0, p1}, Lcom/radaee/reader/GLCanvas;->init(Landroid/content/Context;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 18
    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 19
    invoke-direct {p0, p1}, Lcom/radaee/reader/GLCanvas;->init(Landroid/content/Context;)V

    return-void
.end method

.method private init(Landroid/content/Context;)V
    .locals 0

    return-void
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .locals 1

    .line 40
    iget-object v0, p0, Lcom/radaee/reader/GLCanvas;->m_listener:Lcom/radaee/reader/GLCanvas$CanvasListener;

    if-eqz v0, :cond_0

    invoke-interface {v0, p1}, Lcom/radaee/reader/GLCanvas$CanvasListener;->drawLayer(Landroid/graphics/Canvas;)V

    :cond_0
    return-void
.end method

.method public vOpen(Lcom/radaee/reader/GLCanvas$CanvasListener;)V
    .locals 0

    .line 34
    iput-object p1, p0, Lcom/radaee/reader/GLCanvas;->m_listener:Lcom/radaee/reader/GLCanvas$CanvasListener;

    return-void
.end method
