.class public Lcom/flyersoft/components/androidsvg/utils/CanvasLegacy;
.super Ljava/lang/Object;
.source "CanvasLegacy.java"


# static fields
.field public static final ALL_SAVE_FLAG:I

.field public static final MATRIX_SAVE_FLAG:I

.field private static final SAVE:Ljava/lang/reflect/Method;

.field private static final SAVE_LAYER:Ljava/lang/reflect/Method;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .line 27
    :try_start_0
    const-class v0, Landroid/graphics/Canvas;

    const-string v1, "MATRIX_SAVE_FLAG"

    invoke-virtual {v0, v1}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    sput v0, Lcom/flyersoft/components/androidsvg/utils/CanvasLegacy;->MATRIX_SAVE_FLAG:I

    .line 28
    const-class v0, Landroid/graphics/Canvas;

    const-string v2, "ALL_SAVE_FLAG"

    invoke-virtual {v0, v2}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    sput v0, Lcom/flyersoft/components/androidsvg/utils/CanvasLegacy;->ALL_SAVE_FLAG:I

    .line 30
    const-class v0, Landroid/graphics/Canvas;

    const-string v1, "save"

    const/4 v2, 0x1

    new-array v3, v2, [Ljava/lang/Class;

    sget-object v4, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    const/4 v5, 0x0

    aput-object v4, v3, v5

    invoke-virtual {v0, v1, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    sput-object v0, Lcom/flyersoft/components/androidsvg/utils/CanvasLegacy;->SAVE:Ljava/lang/reflect/Method;

    .line 32
    const-class v0, Landroid/graphics/Canvas;

    const-string v1, "saveLayer"

    const/4 v3, 0x3

    new-array v3, v3, [Ljava/lang/Class;

    const-class v4, Landroid/graphics/RectF;

    aput-object v4, v3, v5

    const-class v4, Landroid/graphics/Paint;

    aput-object v4, v3, v2

    sget-object v2, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    const/4 v4, 0x2

    aput-object v2, v3, v4

    invoke-virtual {v0, v1, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    sput-object v0, Lcom/flyersoft/components/androidsvg/utils/CanvasLegacy;->SAVE_LAYER:Ljava/lang/reflect/Method;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-void

    :catchall_0
    move-exception v0

    .line 34
    invoke-static {v0}, Lcom/flyersoft/components/androidsvg/utils/CanvasLegacy;->sneakyThrow(Ljava/lang/Throwable;)Ljava/lang/RuntimeException;

    move-result-object v0

    throw v0
.end method

.method public constructor <init>()V
    .locals 0

    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static save(Landroid/graphics/Canvas;I)V
    .locals 3

    .line 40
    :try_start_0
    sget-object v0, Lcom/flyersoft/components/androidsvg/utils/CanvasLegacy;->SAVE:Ljava/lang/reflect/Method;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    invoke-virtual {v0, p0, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-void

    :catchall_0
    move-exception p0

    .line 42
    invoke-static {p0}, Lcom/flyersoft/components/androidsvg/utils/CanvasLegacy;->sneakyThrow(Ljava/lang/Throwable;)Ljava/lang/RuntimeException;

    move-result-object p0

    throw p0
.end method

.method public static saveLayer(Landroid/graphics/Canvas;Landroid/graphics/RectF;Landroid/graphics/Paint;I)V
    .locals 3

    .line 58
    :try_start_0
    sget-object v0, Lcom/flyersoft/components/androidsvg/utils/CanvasLegacy;->SAVE_LAYER:Ljava/lang/reflect/Method;

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p3

    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    const/4 p1, 0x1

    aput-object p2, v1, p1

    const/4 p1, 0x2

    aput-object p3, v1, p1

    invoke-virtual {v0, p0, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-void

    :catchall_0
    move-exception p0

    .line 60
    invoke-static {p0}, Lcom/flyersoft/components/androidsvg/utils/CanvasLegacy;->sneakyThrow(Ljava/lang/Throwable;)Ljava/lang/RuntimeException;

    move-result-object p0

    throw p0
.end method

.method private static sneakyThrow(Ljava/lang/Throwable;)Ljava/lang/RuntimeException;
    .locals 1

    if-eqz p0, :cond_0

    .line 48
    invoke-static {p0}, Lcom/flyersoft/components/androidsvg/utils/CanvasLegacy;->sneakyThrow0(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    move-result-object p0

    check-cast p0, Ljava/lang/RuntimeException;

    return-object p0

    .line 47
    :cond_0
    new-instance p0, Ljava/lang/NullPointerException;

    const-string v0, "t"

    invoke-direct {p0, v0}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private static sneakyThrow0(Ljava/lang/Throwable;)Ljava/lang/Throwable;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Throwable;",
            ">(",
            "Ljava/lang/Throwable;",
            ")TT;^TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 53
    throw p0
.end method
