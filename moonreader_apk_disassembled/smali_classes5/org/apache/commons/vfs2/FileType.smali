.class public final enum Lorg/apache/commons/vfs2/FileType;
.super Ljava/lang/Enum;
.source "FileType.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lorg/apache/commons/vfs2/FileType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/apache/commons/vfs2/FileType;

.field public static final enum FILE:Lorg/apache/commons/vfs2/FileType;

.field public static final enum FILE_OR_FOLDER:Lorg/apache/commons/vfs2/FileType;

.field public static final enum FOLDER:Lorg/apache/commons/vfs2/FileType;

.field public static final enum IMAGINARY:Lorg/apache/commons/vfs2/FileType;


# instance fields
.field private final hasAttrs:Z

.field private final hasChildren:Z

.field private final hasContent:Z

.field private final name:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 10

    .line 26
    new-instance v0, Lorg/apache/commons/vfs2/FileType;

    const/4 v5, 0x0

    const/4 v6, 0x1

    const-string v1, "FOLDER"

    const/4 v2, 0x0

    const-string v3, "folder"

    const/4 v4, 0x1

    invoke-direct/range {v0 .. v6}, Lorg/apache/commons/vfs2/FileType;-><init>(Ljava/lang/String;ILjava/lang/String;ZZZ)V

    sput-object v0, Lorg/apache/commons/vfs2/FileType;->FOLDER:Lorg/apache/commons/vfs2/FileType;

    .line 31
    new-instance v1, Lorg/apache/commons/vfs2/FileType;

    const/4 v7, 0x1

    const-string v2, "FILE"

    const/4 v3, 0x1

    const-string v4, "file"

    invoke-direct/range {v1 .. v7}, Lorg/apache/commons/vfs2/FileType;-><init>(Ljava/lang/String;ILjava/lang/String;ZZZ)V

    sput-object v1, Lorg/apache/commons/vfs2/FileType;->FILE:Lorg/apache/commons/vfs2/FileType;

    .line 36
    new-instance v2, Lorg/apache/commons/vfs2/FileType;

    const/4 v8, 0x1

    const-string v3, "FILE_OR_FOLDER"

    const/4 v4, 0x2

    const-string v5, "fileOrFolder"

    invoke-direct/range {v2 .. v8}, Lorg/apache/commons/vfs2/FileType;-><init>(Ljava/lang/String;ILjava/lang/String;ZZZ)V

    sput-object v2, Lorg/apache/commons/vfs2/FileType;->FILE_OR_FOLDER:Lorg/apache/commons/vfs2/FileType;

    .line 41
    new-instance v3, Lorg/apache/commons/vfs2/FileType;

    const/4 v8, 0x0

    const/4 v9, 0x0

    const-string v4, "IMAGINARY"

    const/4 v5, 0x3

    const-string v6, "imaginary"

    const/4 v7, 0x0

    invoke-direct/range {v3 .. v9}, Lorg/apache/commons/vfs2/FileType;-><init>(Ljava/lang/String;ILjava/lang/String;ZZZ)V

    sput-object v3, Lorg/apache/commons/vfs2/FileType;->IMAGINARY:Lorg/apache/commons/vfs2/FileType;

    const/4 v4, 0x4

    .line 22
    new-array v4, v4, [Lorg/apache/commons/vfs2/FileType;

    const/4 v5, 0x0

    aput-object v0, v4, v5

    const/4 v0, 0x1

    aput-object v1, v4, v0

    const/4 v0, 0x2

    aput-object v2, v4, v0

    const/4 v0, 0x3

    aput-object v3, v4, v0

    sput-object v4, Lorg/apache/commons/vfs2/FileType;->$VALUES:[Lorg/apache/commons/vfs2/FileType;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/String;ZZZ)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "ZZZ)V"
        }
    .end annotation

    .line 55
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 56
    iput-object p3, p0, Lorg/apache/commons/vfs2/FileType;->name:Ljava/lang/String;

    .line 57
    iput-boolean p4, p0, Lorg/apache/commons/vfs2/FileType;->hasChildren:Z

    .line 58
    iput-boolean p5, p0, Lorg/apache/commons/vfs2/FileType;->hasContent:Z

    .line 59
    iput-boolean p6, p0, Lorg/apache/commons/vfs2/FileType;->hasAttrs:Z

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/apache/commons/vfs2/FileType;
    .locals 1

    .line 22
    const-class v0, Lorg/apache/commons/vfs2/FileType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lorg/apache/commons/vfs2/FileType;

    return-object p0
.end method

.method public static values()[Lorg/apache/commons/vfs2/FileType;
    .locals 1

    .line 22
    sget-object v0, Lorg/apache/commons/vfs2/FileType;->$VALUES:[Lorg/apache/commons/vfs2/FileType;

    invoke-virtual {v0}, [Lorg/apache/commons/vfs2/FileType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/apache/commons/vfs2/FileType;

    return-object v0
.end method


# virtual methods
.method public getName()Ljava/lang/String;
    .locals 1

    .line 78
    iget-object v0, p0, Lorg/apache/commons/vfs2/FileType;->name:Ljava/lang/String;

    return-object v0
.end method

.method public hasAttributes()Z
    .locals 1

    .line 105
    iget-boolean v0, p0, Lorg/apache/commons/vfs2/FileType;->hasAttrs:Z

    return v0
.end method

.method public hasChildren()Z
    .locals 1

    .line 87
    iget-boolean v0, p0, Lorg/apache/commons/vfs2/FileType;->hasChildren:Z

    return v0
.end method

.method public hasContent()Z
    .locals 1

    .line 96
    iget-boolean v0, p0, Lorg/apache/commons/vfs2/FileType;->hasContent:Z

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .line 69
    iget-object v0, p0, Lorg/apache/commons/vfs2/FileType;->name:Ljava/lang/String;

    return-object v0
.end method
