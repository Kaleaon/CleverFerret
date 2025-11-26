.class public Lcom/dozof/app/MLoader;
.super Ljava/lang/Object;
.source "MLoader.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dozof/app/MLoader$MItem;
    }
.end annotation


# static fields
.field public static lastFile:Ljava/lang/String;


# direct methods
.method static bridge synthetic -$$Nest$smgetData(I)[B
    .locals 0

    invoke-static {p0}, Lcom/dozof/app/MLoader;->getData(I)[B

    move-result-object p0

    return-object p0
.end method

.method public constructor <init>()V
    .locals 0

    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static native free()I
.end method

.method public static freeMem()V
    .locals 1

    .line 86
    sget-object v0, Lcom/dozof/app/MLoader;->lastFile:Ljava/lang/String;

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    .line 88
    :try_start_0
    sput-object v0, Lcom/dozof/app/MLoader;->lastFile:Ljava/lang/String;

    .line 89
    invoke-static {}, Lcom/dozof/app/MLoader;->free()I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-void

    :catchall_0
    move-exception v0

    .line 91
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    :cond_0
    return-void
.end method

.method private static native getData(I)[B
.end method

.method private static native getName(I)Ljava/lang/String;
.end method

.method private static native getNum()I
.end method

.method private static native load(Ljava/lang/String;)I
.end method

.method public static loadFile(Ljava/lang/String;Z)Ljava/util/ArrayList;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Z)",
            "Ljava/util/ArrayList<",
            "Lcom/dozof/app/MLoader$MItem;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 53
    invoke-static {}, Lcom/dozof/app/MLoader;->freeMem()V

    .line 56
    :try_start_0
    const-string v0, "mloader"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 62
    invoke-static {p0}, Lcom/dozof/app/MLoader;->load(Ljava/lang/String;)I

    move-result v0

    if-nez v0, :cond_0

    const/4 p0, 0x0

    return-object p0

    .line 67
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 69
    invoke-static {}, Lcom/dozof/app/MLoader;->getNum()I

    move-result v1

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_2

    .line 71
    invoke-static {v2}, Lcom/dozof/app/MLoader;->getName(I)Ljava/lang/String;

    move-result-object v3

    .line 72
    new-instance v4, Lcom/dozof/app/MLoader$MItem;

    invoke-direct {v4}, Lcom/dozof/app/MLoader$MItem;-><init>()V

    .line 73
    iput-object v3, v4, Lcom/dozof/app/MLoader$MItem;->filename:Ljava/lang/String;

    .line 74
    iput v2, v4, Lcom/dozof/app/MLoader$MItem;->pos:I

    if-eqz p1, :cond_1

    const/4 v3, 0x1

    goto :goto_1

    .line 75
    :cond_1
    invoke-static {v2}, Lcom/dozof/app/MLoader;->getData(I)[B

    move-result-object v3

    array-length v3, v3

    :goto_1
    iput v3, v4, Lcom/dozof/app/MLoader$MItem;->length:I

    .line 76
    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 79
    :cond_2
    sput-object p0, Lcom/dozof/app/MLoader;->lastFile:Ljava/lang/String;

    return-object v0

    :catchall_0
    move-exception p0

    .line 58
    invoke-static {p0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 59
    new-instance p1, Ljava/lang/Exception;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Incompatible device CPU: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {}, Lcom/flyersoft/tools/T;->CPU_ABI()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {p0}, Lcom/flyersoft/tools/A;->errorMsg(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {p1, p0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public static native mobiToEpub(Ljava/lang/String;Ljava/lang/String;)I
.end method
